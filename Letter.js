// constants
var TODAY = new Date()

// ORCA API 情報
var AUTH = " -u ormaster:ormaster"
var POST_OPTION = " -X POST -H 'Content-Type: application/json' -d '%REQUEST%'"
var PATIENTGETV2 = "'http://orca:8000/api01rv2/patientgetv2?id=%PATIENT_NUM%&format=json'"
var DISEASEGETV2 = "'http://orca:8000/api01rv2/diseasegetv2?class=01'"

// Pages 起動
var PAGES = Application("Pages")
PAGES.includeStandardAdditions = true
PAGES.activate()

/**
 * Shell script を実行して結果を返す.
 */
function shellScript(script) {
	let app = Application.currentApplication()
	app.includeStandardAdditions = true
	return app.doShellScript(script)
}

/**
 * POST.
 */
function httpPost(url, req) {
	return shellScript("curl" + AUTH + POST_OPTION.replace("%REQUEST%", req) + " " + url)
}

/**
 * GET.
 */
function httpGet(url) {
	return shellScript("curl" + AUTH + " " + url)
}

/**
 * 今日を "2020年5月1日" 型式で返す.
 */
function today() {
	return formatDate(TODAY);
}

/**
 * ISO型式(2020-05-01) を "2020年5月1日" 型式に変換.
 */
function formatIsoDate(isoDate) {
	return formatDate(new Date(Date.parse(isoDate)))
}

/**
 * Date クラスを "2020年5月1日" 型式にフォーマットして返す.
 */
function formatDate(date) {
	return date.getFullYear() + " 年 " + (date.getMonth() + 1) + " 月 " + date.getDate() + " 日"
}

/**
 * ISO型式を元号型式に変換.
 */
function isoToGengo(iso) {
	let command = "ruby -r 'date' -e 'puts Date.parse(\"" + iso + "\").jisx0301'"
	let res = shellScript(command)
	let gengo = res.startsWith("M")? "明治" :
		res.startsWith("T")? "大正" :
		res.startsWith("S")? "昭和" :
		res.startsWith("H")? "平成" : "令和"
	let year = res.slice(1,3)
	let month = res.slice(4,6)
	let day = res.slice(7)
		
	year = year.startsWith("0")? year.slice(1, 2) : year
	year = year == 1? "元" : year
	month = month.startsWith("0")? month.slice(1, 2) : month
	day = day.startsWith("0")? day.slice(1, 2) : day
	
	return gengo + " " + year + " 年 " + month + " 月 " + day + " 日" 
}

/**
 * Calculate age.
 */
function calculateAge (isoDate) {
	let birthday = new Date(Date.parse(isoDate))
    let years = (TODAY.getFullYear() - birthday.getFullYear());

    if (TODAY.getMonth() < birthday.getMonth()
		|| TODAY.getMonth() == birthday.getMonth()
		&& TODAY.getDate() < birthday.getDate()) {
        years--;
    }
    return years;
}

/**
 * 紹介先情報を連絡先アプリから取得.
 */
function referralInfo() {
	let app = Application("Contacts")
	app.includeStandardAdditions = true
	//app.activate()

	let person = app.selection()[0]
	let org = person.organization()
	let lastName = person.lastName()
	let firstName = person.firstName()
	let name = lastName + " " + firstName
	let addr = person.addresses()[0]
	let zip = addr.zip()
	let city = addr.city()
	let street = addr.street()
	// enum を返す
	return {
		Org : org, Dr : name,
		Address : city + street, Zip : zip,
	}
}

/**
 * 病名情報の取得.
 */
function diagnosisInfo(ptNum) {
	let baseDate = TODAY.getFullYear() + "-" + ("00" + (TODAY.getMonth() + 1)).slice(-2)
	let req = JSON.stringify({
		disease_inforeq : {
			Patient_ID : ptNum,
			Base_date : baseDate
		}
	})
	let res = httpPost(DISEASEGETV2, req)
	let diagInfo= JSON.parse(res)	
	let diags = diagInfo.disease_infores.Disease_Information

	// まだ病名がついていない場合
	if (diags == null) {
		return ""
	}

	let diagnosis = ""

	for (let i=0; i<diags.length; i++) {
		let diag = diags[i].Disease_Name
		if (diag != null) {
			diagnosis = diagnosis + diag
			if (diags[i].Disease_SuspectedFlag == "S") {
				diagnosis = diagnosis + "の疑い"
			}
			diagnosis = diagnosis + ", "
		}
	}
	return diagnosis.slice(0, diagnosis.length - 2)
}

/**
 * 患者番号を入力して患者情報を返す.
 */
function patientInfo() {
	// ダイアログ表示
	var option = {
		defaultAnswer: "", withIcon: "note", 
		buttons: ["Cancel", "Continue"],
		defaultButton: "Continue"
	}
	
	let result = PAGES.displayDialog("患者番号", option)
	
	if (result.buttonReturned == "Continue") {
		let num = result.textReturned
		// 0を埋めて6桁にする
		num = ("000000" + num).slice(-6)
		
		let res = httpGet(PATIENTGETV2.replace("%PATIENT_NUM%", num))
		let pt = JSON.parse(res)
		
		let ptName = pt.patientinfores.Patient_Information.WholeName
		let ptBirthday = pt.patientinfores.Patient_Information.BirthDate
		let ptAge = calculateAge(ptBirthday)
		let ptSex = pt.patientinfores.Patient_Information.Sex
		let ptGender = ptSex == "1" ? "男" : "女"
		let ptAddrInfo =  pt.patientinfores.Patient_Information.Home_Address_Information

		let ptZip = ""
		let ptAddr = ""
		let ptPhone = ""

		if (ptAddrInfo != null) {
			ptZip = ptAddrInfo.Address_ZipCode
			let addr1 = ptAddrInfo.WholeAddress1
			let addr2 = ptAddrInfo.WholeAddress2
			ptAddr = addr1 + (addr2 == null? "" : addr2)
			ptPhone = ptAddrInfo.PhoneNumber1
			if (ptPhone != null) {
				if (ptPhone.length == 11) {
					// 携帯
					ptPhone = ptPhone.slice(0,3) + "-" + ptPhone.slice(3,7) + "-" + ptPhone.slice(7)
					ptPhone = "℡ " + ptPhone
				} else if (ptPhone.length == 10) {
					if  (ptPhone.startsWith("03") || ptPhone.startsWith("06")) {
						// 東京・大阪
						ptPhone = ptPhone.slice(0,2) + "-" + ptPhone.slice(2,6) + "-" + ptPhone.slice(6)
					} else {
						ptPhone = ptPhone.slice(0,3) + "-" + ptPhone.slice(3,6) + "-" + ptPhone.slice(6)
					}
					ptPhone = "☎ " + ptPhone
				}
			} else {
				ptPhone = ""
			}
		}
		// 病名取得
		let ptDiag = diagnosisInfo(num)
		
		// enum を返す
		return {
			Name: ptName, Birthday: isoToGengo(ptBirthday), Age: ptAge, Gender: ptGender,
			Zip: ptZip, Address: ptAddr, Phone: ptPhone, Diagnosis : ptDiag
		}
	}
}

/**
 * Placeholder があるかどうかチェックして, あればセットする.
 */
function placeholder(doc, tag, item) {
	let ph = doc.placeholderTexts.whose({tag: tag})
	if (ph.length != 0) {
		ph[0].set(item)
	}	
}

/**
 * 患者情報の挿入.
 */
function addPatientInfo(doc) {
	let pt = patientInfo()		
	placeholder(doc, "date", today())	
	placeholder(doc, "ptName", pt.Name)
	placeholder(doc, "ptBirthday", pt.Birthday)
	placeholder(doc, "ptAge", pt.Age)
	placeholder(doc, "ptAddr", pt.Address)
	placeholder(doc, "ptDiag", pt.Diagnosis)
	placeholder(doc, "ptPhone", pt.Phone)
	placeholder(doc, "ptGend", pt.Gender)
}

/**
 * 紹介先情報の挿入.
 */
function addReferralInfo(doc) {
	let ref = referralInfo()
	placeholder(doc, "refZip", ref.Zip)
	placeholder(doc, "refAddr", ref.Address)
	placeholder(doc, "refOrg", ref.Org)
	placeholder(doc, "refDr", ref.Dr)
}

/**
 * template 名の Pages Document を作って返す.
 */
function pagesDocument(template) {
	let doc = PAGES.Document({documentTemplate: PAGES.templates[template]})
	doc.make()
	return doc
}

/**
 * 添書作成.
 */
function makeLetter(templ) {
	let doc = pagesDocument(templ)
	addPatientInfo(doc)	
	addReferralInfo(doc)
}

/**
 * ドキュメント作成.
 */
function makeDocument(templ) {
	let doc = pagesDocument(templ)
	addPatientInfo(doc)	
}

//
// main
//
var options = ["紹介状", "お返事", "診断書", "パッチテスト", "訪看", "特訪看"]
var job = PAGES.chooseFromList(options)

switch (job.toString()) {
	case "紹介状":
		makeLetter("Letter")
		break;
		
	case "お返事":
		makeLetter("Reply")
		break;
		
	case "診断書":
		makeDocument("Certificate")
		break;

	case "訪看":
		makeDocument("HomeNursing")
		break;
		
	case "特訪看":
		makeDocument("HomeNursingEx")
		break;
	case "パッチテスト":
		makeDocument("PatchTest")
		break;	
}
