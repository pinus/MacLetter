JsOsaDAS1.001.00bplist00�Vscripto� / /   c o n s t a n t s 
 v a r   T O D A Y   =   n e w   D a t e ( ) 
 
 / /   O R C A   A P I  `�X1 
 v a r   A U T H   =   "   - u   o r m a s t e r : o r m a s t e r " 
 v a r   P O S T _ O P T I O N   =   "   - X   P O S T   - H   ' C o n t e n t - T y p e :   a p p l i c a t i o n / j s o n '   - d   ' % R E Q U E S T % ' " 
 v a r   P A T I E N T G E T V 2   =   " ' h t t p : / / w e b o r c a : 8 0 0 0 / a p i / a p i 0 1 r v 2 / p a t i e n t g e t v 2 ? i d = % P A T I E N T _ N U M % & f o r m a t = j s o n ' " 
 v a r   D I S E A S E G E T V 2   =   " ' h t t p : / / w e b o r c a : 8 0 0 0 / a p i / a p i 0 1 r v 2 / d i s e a s e g e t v 2 ? c l a s s = 0 1 ' " 
 
 / /   P a g e s  �wR� 
 v a r   P A G E S   =   A p p l i c a t i o n ( " P a g e s " ) 
 P A G E S . i n c l u d e S t a n d a r d A d d i t i o n s   =   t r u e 
 P A G E S . a c t i v a t e ( ) 
 
 / * * 
   *   S h e l l   s c r i p t  0�[��L0W0f}Pg�0���0Y . 
   * / 
 f u n c t i o n   s h e l l S c r i p t ( s c r i p t )   { 
 	 l e t   a p p   =   A p p l i c a t i o n . c u r r e n t A p p l i c a t i o n ( ) 
 	 a p p . i n c l u d e S t a n d a r d A d d i t i o n s   =   t r u e 
 	 r e t u r n   a p p . d o S h e l l S c r i p t ( s c r i p t ) 
 } 
 
 / * * 
   *   P O S T . 
   * / 
 f u n c t i o n   h t t p P o s t ( u r l ,   r e q )   { 
 	 r e t u r n   s h e l l S c r i p t ( " c u r l "   +   A U T H   +   P O S T _ O P T I O N . r e p l a c e ( " % R E Q U E S T % " ,   r e q )   +   "   "   +   u r l ) 
 } 
 
 / * * 
   *   G E T . 
   * / 
 f u n c t i o n   h t t p G e t ( u r l )   { 
 	 r e t u r n   s h e l l S c r i p t ( " c u r l "   +   A U T H   +   "   "   +   u r l ) 
 } 
 
 / * * 
   *  N�e�0�   " 2 0 2 0^t 5g 1e� "  W�_0g��0Y . 
   * / 
 f u n c t i o n   t o d a y ( )   { 
 	 r e t u r n   f o r m a t D a t e ( T O D A Y ) ; 
 } 
 
 / * * 
   *   I S OW�_ ( 2 0 2 0 - 0 5 - 0 1 )  0�   " 2 0 2 0^t 5g 1e� "  W�_0kY	c� . 
   * / 
 f u n c t i o n   f o r m a t I s o D a t e ( i s o D a t e )   { 
 	 r e t u r n   f o r m a t D a t e ( n e w   D a t e ( D a t e . p a r s e ( i s o D a t e ) ) ) 
 } 
 
 / * * 
   *   D a t e  0�0�0�0�   " 2 0 2 0^t 5g 1e� "  W�_0k0�0�0�0�0�0�0W0f��0Y . 
   * / 
 f u n c t i o n   f o r m a t D a t e ( d a t e )   { 
 	 r e t u r n   d a t e . g e t F u l l Y e a r ( )   +   "  ^t   "   +   ( d a t e . g e t M o n t h ( )   +   1 )   +   "  g   "   +   d a t e . g e t D a t e ( )   +   "  e� " 
 } 
 
 / * * 
   *   I S OW�_0�QCS�W�_0kY	c� . 
   * / 
 f u n c t i o n   i s o T o G e n g o ( i s o )   { 
 	 l e t   c o m m a n d   =   " r u b y   - r   ' d a t e '   - e   ' p u t s   D a t e . p a r s e ( \ " "   +   i s o   +   " \ " ) . j i s x 0 3 0 1 ' " 
 	 l e t   r e s   =   s h e l l S c r i p t ( c o m m a n d ) 
 	 l e t   g e n g o   =   r e s . s t a r t s W i t h ( " M " ) ?   "fl� "   : 
 	 	 r e s . s t a r t s W i t h ( " T " ) ?   "Y'kc "   : 
 	 	 r e s . s t a r t s W i t h ( " S " ) ?   "f-T� "   : 
 	 	 r e s . s t a r t s W i t h ( " H " ) ?   "^sb "   :   "N�T� " 
 	 l e t   y e a r   =   r e s . s l i c e ( 1 , 3 ) 
 	 l e t   m o n t h   =   r e s . s l i c e ( 4 , 6 ) 
 	 l e t   d a y   =   r e s . s l i c e ( 7 ) 
 	 	 
 	 y e a r   =   y e a r . s t a r t s W i t h ( " 0 " ) ?   y e a r . s l i c e ( 1 ,   2 )   :   y e a r 
 	 y e a r   =   y e a r   = =   1 ?   "QC "   :   y e a r 
 	 m o n t h   =   m o n t h . s t a r t s W i t h ( " 0 " ) ?   m o n t h . s l i c e ( 1 ,   2 )   :   m o n t h 
 	 d a y   =   d a y . s t a r t s W i t h ( " 0 " ) ?   d a y . s l i c e ( 1 ,   2 )   :   d a y 
 	 
 	 r e t u r n   g e n g o   +   "   "   +   y e a r   +   "  ^t   "   +   m o n t h   +   "  g   "   +   d a y   +   "  e� "   
 } 
 
 / * * 
   *   C a l c u l a t e   a g e . 
   * / 
 f u n c t i o n   c a l c u l a t e A g e   ( i s o D a t e )   { 
 	 l e t   b i r t h d a y   =   n e w   D a t e ( D a t e . p a r s e ( i s o D a t e ) ) 
         l e t   y e a r s   =   ( T O D A Y . g e t F u l l Y e a r ( )   -   b i r t h d a y . g e t F u l l Y e a r ( ) ) ; 
 
         i f   ( T O D A Y . g e t M o n t h ( )   <   b i r t h d a y . g e t M o n t h ( ) 
 	 	 | |   T O D A Y . g e t M o n t h ( )   = =   b i r t h d a y . g e t M o n t h ( ) 
 	 	 & &   T O D A Y . g e t D a t e ( )   <   b i r t h d a y . g e t D a t e ( ) )   { 
                 y e a r s - - ; 
         } 
         r e t u r n   y e a r s ; 
 } 
 
 / * * 
   *  }9N�QH`�X10��#}aQH0�0�0�0K0�S�_� . 
   * / 
 f u n c t i o n   r e f e r r a l I n f o ( )   { 
 	 l e t   a p p   =   A p p l i c a t i o n ( " C o n t a c t s " ) 
 	 a p p . i n c l u d e S t a n d a r d A d d i t i o n s   =   t r u e 
 	 / / a p p . a c t i v a t e ( ) 
 
 	 l e t   p e r s o n   =   a p p . s e l e c t i o n ( ) [ 0 ] 
 	 l e t   o r g   =   p e r s o n . o r g a n i z a t i o n ( ) 
 	 l e t   l a s t N a m e   =   p e r s o n . l a s t N a m e ( ) 
 	 l e t   f i r s t N a m e   =   p e r s o n . f i r s t N a m e ( ) 
 	 l e t   n a m e   =   l a s t N a m e   +   "   "   +   f i r s t N a m e 
 	 l e t   a d d r   =   p e r s o n . a d d r e s s e s ( ) [ 0 ] 
 	 l e t   z i p   =   a d d r . z i p ( ) 
 	 l e t   c i t y   =   a d d r . c i t y ( ) 
 	 l e t   s t r e e t   =   a d d r . s t r e e t ( ) 
 	 / /   e n u m  0���0Y 
 	 r e t u r n   { 
 	 	 O r g   :   o r g ,   D r   :   n a m e , 
 	 	 A d d r e s s   :   c i t y   +   s t r e e t ,   Z i p   :   z i p , 
 	 } 
 } 
 
 / * * 
   *  u�T`�X10nS�_� . 
   * / 
 f u n c t i o n   d i a g n o s i s I n f o ( p t N u m )   { 
 	 l e t   b a s e D a t e   =   T O D A Y . g e t F u l l Y e a r ( )   +   " - "   +   ( " 0 0 "   +   ( T O D A Y . g e t M o n t h ( )   +   1 ) ) . s l i c e ( - 2 ) 
 	 l e t   r e q   =   J S O N . s t r i n g i f y ( { 
 	 	 d i s e a s e _ i n f o r e q   :   { 
 	 	 	 P a t i e n t _ I D   :   p t N u m , 
 	 	 	 B a s e _ d a t e   :   b a s e D a t e 
 	 	 } 
 	 } ) 
 	 l e t   r e s   =   h t t p P o s t ( D I S E A S E G E T V 2 ,   r e q ) 
 	 l e t   d i a g I n f o =   J S O N . p a r s e ( r e s ) 	 
 	 l e t   d i a g s   =   d i a g I n f o . d i s e a s e _ i n f o r e s . D i s e a s e _ I n f o r m a t i o n 
 
 	 / /  0~0`u�T0L0d0D0f0D0j0DX4T 
 	 i f   ( d i a g s   = =   n u l l )   { 
 	 	 r e t u r n   " " 
 	 } 
 
 	 l e t   d i a g n o s i s   =   " " 
 
 	 f o r   ( l e t   i = 0 ;   i < d i a g s . l e n g t h ;   i + + )   { 
 	 	 l e t   d i a g   =   d i a g s [ i ] . D i s e a s e _ N a m e 
 	 	 i f   ( d i a g   ! =   n u l l )   { 
 	 	 	 d i a g n o s i s   =   d i a g n o s i s   +   d i a g 
 	 	 	 i f   ( d i a g s [ i ] . D i s e a s e _ S u s p e c t e d F l a g   = =   " S " )   { 
 	 	 	 	 d i a g n o s i s   =   d i a g n o s i s   +   "0nu�0D " 
 	 	 	 } 
 	 	 	 d i a g n o s i s   =   d i a g n o s i s   +   " ,   " 
 	 	 } 
 	 } 
 	 r e t u r n   d i a g n o s i s . s l i c e ( 0 ,   d i a g n o s i s . l e n g t h   -   2 ) 
 } 
 
 / * * 
   *  `��ujS�0�QeR�0W0f`��`�X10���0Y . 
   * / 
 f u n c t i o n   p a t i e n t I n f o ( )   { 
 	 / /  0�0�0�0�0��hy: 
 	 v a r   o p t i o n   =   { 
 	 	 d e f a u l t A n s w e r :   " " ,   w i t h I c o n :   " n o t e " ,   
 	 	 b u t t o n s :   [ " C a n c e l " ,   " C o n t i n u e " ] , 
 	 	 d e f a u l t B u t t o n :   " C o n t i n u e " 
 	 } 
 	 
 	 l e t   r e s u l t   =   P A G E S . d i s p l a y D i a l o g ( "`��ujS� " ,   o p t i o n ) 
 	 
 	 i f   ( r e s u l t . b u t t o n R e t u r n e d   = =   " C o n t i n u e " )   { 
 	 	 l e t   n u m   =   r e s u l t . t e x t R e t u r n e d 
 	 	 / /   00�W�0�0f 6hA0k0Y0� 
 	 	 n u m   =   ( " 0 0 0 0 0 0 "   +   n u m ) . s l i c e ( - 6 ) 
 	 	 
 	 	 l e t   r e s   =   h t t p G e t ( P A T I E N T G E T V 2 . r e p l a c e ( " % P A T I E N T _ N U M % " ,   n u m ) ) 
 	 	 l e t   p t   =   J S O N . p a r s e ( r e s ) 
 	 	 
 	 	 l e t   p t N a m e   =   p t . p a t i e n t i n f o r e s . P a t i e n t _ I n f o r m a t i o n . W h o l e N a m e 
 	 	 l e t   p t B i r t h d a y   =   p t . p a t i e n t i n f o r e s . P a t i e n t _ I n f o r m a t i o n . B i r t h D a t e 
 	 	 l e t   p t A g e   =   c a l c u l a t e A g e ( p t B i r t h d a y ) 
 	 	 l e t   p t S e x   =   p t . p a t i e n t i n f o r e s . P a t i e n t _ I n f o r m a t i o n . S e x 
 	 	 l e t   p t G e n d e r   =   p t S e x   = =   " 1 "   ?   "u7 "   :   "Ys " 
 	 	 l e t   p t A d d r I n f o   =     p t . p a t i e n t i n f o r e s . P a t i e n t _ I n f o r m a t i o n . H o m e _ A d d r e s s _ I n f o r m a t i o n 
 
 	 	 l e t   p t Z i p   =   " " 
 	 	 l e t   p t A d d r   =   " " 
 	 	 l e t   p t P h o n e   =   " " 
 
 	 	 i f   ( p t A d d r I n f o   ! =   n u l l )   { 
 	 	 	 p t Z i p   =   p t A d d r I n f o . A d d r e s s _ Z i p C o d e 
 	 	 	 l e t   a d d r 1   =   p t A d d r I n f o . W h o l e A d d r e s s 1 
 	 	 	 l e t   a d d r 2   =   p t A d d r I n f o . W h o l e A d d r e s s 2 
 	 	 	 p t A d d r   =   a d d r 1   +   ( a d d r 2   = =   n u l l ?   " "   :   a d d r 2 ) 
 	 	 	 p t P h o n e   =   p t A d d r I n f o . P h o n e N u m b e r 1 
 	 	 	 i f   ( p t P h o n e   ! =   n u l l )   { 
 	 	 	 	 i f   ( p t P h o n e . l e n g t h   = =   1 1 )   { 
 	 	 	 	 	 / /  d:^/ 
 	 	 	 	 	 p t P h o n e   =   p t P h o n e . s l i c e ( 0 , 3 )   +   " - "   +   p t P h o n e . s l i c e ( 3 , 7 )   +   " - "   +   p t P h o n e . s l i c e ( 7 ) 
 	 	 	 	 	 p t P h o n e   =   "!!   "   +   p t P h o n e 
 	 	 	 	 }   e l s e   i f   ( p t P h o n e . l e n g t h   = =   1 0 )   { 
 	 	 	 	 	 i f     ( p t P h o n e . s t a r t s W i t h ( " 0 3 " )   | |   p t P h o n e . s t a r t s W i t h ( " 0 6 " ) )   { 
 	 	 	 	 	 	 / /  gqN�0�Y'�* 
 	 	 	 	 	 	 p t P h o n e   =   p t P h o n e . s l i c e ( 0 , 2 )   +   " - "   +   p t P h o n e . s l i c e ( 2 , 6 )   +   " - "   +   p t P h o n e . s l i c e ( 6 ) 
 	 	 	 	 	 }   e l s e   { 
 	 	 	 	 	 	 p t P h o n e   =   p t P h o n e . s l i c e ( 0 , 3 )   +   " - "   +   p t P h o n e . s l i c e ( 3 , 6 )   +   " - "   +   p t P h o n e . s l i c e ( 6 ) 
 	 	 	 	 	 } 
 	 	 	 	 	 p t P h o n e   =   "&   "   +   p t P h o n e 
 	 	 	 	 } 
 	 	 	 }   e l s e   { 
 	 	 	 	 p t P h o n e   =   " " 
 	 	 	 } 
 	 	 } 
 	 	 / /  u�TS�_� 
 	 	 l e t   p t D i a g   =   d i a g n o s i s I n f o ( n u m ) 
 	 	 
 	 	 / /   e n u m  0���0Y 
 	 	 r e t u r n   { 
 	 	 	 N a m e :   p t N a m e ,   B i r t h d a y :   i s o T o G e n g o ( p t B i r t h d a y ) ,   A g e :   p t A g e ,   G e n d e r :   p t G e n d e r , 
 	 	 	 Z i p :   p t Z i p ,   A d d r e s s :   p t A d d r ,   P h o n e :   p t P h o n e ,   D i a g n o s i s   :   p t D i a g 
 	 	 } 
 	 } 
 } 
 
 / * * 
   *   P l a c e h o l d e r  0L0B0�0K0i0F0K0�0�0�0�0W0f ,  0B0�0p0�0�0�0Y0� . 
   * / 
 f u n c t i o n   p l a c e h o l d e r ( d o c ,   t a g ,   i t e m )   { 
 	 l e t   p h   =   d o c . p l a c e h o l d e r T e x t s . w h o s e ( { t a g :   t a g } ) 
 	 i f   ( p h . l e n g t h   ! =   0 )   { 
 	 	 p h [ 0 ] . s e t ( i t e m ) 
 	 } 	 
 } 
 
 / * * 
   *  `��`�X10nc?Qe . 
   * / 
 f u n c t i o n   a d d P a t i e n t I n f o ( d o c )   { 
 	 l e t   p t   =   p a t i e n t I n f o ( ) 	 	 
 	 p l a c e h o l d e r ( d o c ,   " d a t e " ,   t o d a y ( ) ) 	 
 	 p l a c e h o l d e r ( d o c ,   " p t N a m e " ,   p t . N a m e ) 
 	 p l a c e h o l d e r ( d o c ,   " p t B i r t h d a y " ,   p t . B i r t h d a y ) 
 	 p l a c e h o l d e r ( d o c ,   " p t A g e " ,   p t . A g e ) 
 	 p l a c e h o l d e r ( d o c ,   " p t A d d r " ,   p t . A d d r e s s ) 
 	 p l a c e h o l d e r ( d o c ,   " p t D i a g " ,   p t . D i a g n o s i s ) 
 	 p l a c e h o l d e r ( d o c ,   " p t P h o n e " ,   p t . P h o n e ) 
 	 p l a c e h o l d e r ( d o c ,   " p t G e n d " ,   p t . G e n d e r ) 
 } 
 
 / * * 
   *  }9N�QH`�X10nc?Qe . 
   * / 
 f u n c t i o n   a d d R e f e r r a l I n f o ( d o c )   { 
 	 l e t   r e f   =   r e f e r r a l I n f o ( ) 
 	 p l a c e h o l d e r ( d o c ,   " r e f Z i p " ,   r e f . Z i p ) 
 	 p l a c e h o l d e r ( d o c ,   " r e f A d d r " ,   r e f . A d d r e s s ) 
 	 p l a c e h o l d e r ( d o c ,   " r e f O r g " ,   r e f . O r g ) 
 	 p l a c e h o l d e r ( d o c ,   " r e f D r " ,   r e f . D r ) 
 } 
 
 / * * 
   *   t e m p l a t e  T0n   P a g e s   D o c u m e n t  0�O\0c0f��0Y . 
   * / 
 f u n c t i o n   p a g e s D o c u m e n t ( t e m p l a t e )   { 
 	 l e t   d o c   =   P A G E S . D o c u m e n t ( { d o c u m e n t T e m p l a t e :   P A G E S . t e m p l a t e s [ t e m p l a t e ] } ) 
 	 d o c . m a k e ( ) 
 	 r e t u r n   d o c 
 } 
 
 / * * 
   *  m�f�O\b . 
   * / 
 f u n c t i o n   m a k e L e t t e r ( t e m p l )   { 
 	 l e t   d o c   =   p a g e s D o c u m e n t ( t e m p l ) 
 	 a d d P a t i e n t I n f o ( d o c ) 	 
 	 a d d R e f e r r a l I n f o ( d o c ) 
 } 
 
 / * * 
   *  0�0�0�0�0�0�O\b . 
   * / 
 f u n c t i o n   m a k e D o c u m e n t ( t e m p l )   { 
 	 l e t   d o c   =   p a g e s D o c u m e n t ( t e m p l ) 
 	 a d d P a t i e n t I n f o ( d o c ) 	 
 } 
 
 / / 
 / /   m a i n 
 / / 
 v a r   o p t i o n s   =   [ "}9N�r� " ,   "0J��N� " ,   "�:e�f� " ,   "0�0�0�0�0�0� " ,   "�*w " ,   "ry�*w " ] 
 v a r   j o b   =   P A G E S . c h o o s e F r o m L i s t ( o p t i o n s ) 
 
 s w i t c h   ( j o b . t o S t r i n g ( ) )   { 
 	 c a s e   "}9N�r� " : 
 	 	 m a k e L e t t e r ( " L e t t e r " ) 
 	 	 b r e a k ; 
 	 	 
 	 c a s e   "0J��N� " : 
 	 	 m a k e L e t t e r ( " R e p l y " ) 
 	 	 b r e a k ; 
 	 	 
 	 c a s e   "�:e�f� " : 
 	 	 m a k e D o c u m e n t ( " C e r t i f i c a t e " ) 
 	 	 b r e a k ; 
 
 	 c a s e   "�*w " : 
 	 	 m a k e D o c u m e n t ( " H o m e N u r s i n g " ) 
 	 	 b r e a k ; 
 	 	 
 	 c a s e   "ry�*w " : 
 	 	 m a k e D o c u m e n t ( " H o m e N u r s i n g E x " ) 
 	 	 b r e a k ; 
 	 c a s e   "0�0�0�0�0�0� " : 
 	 	 m a k e D o c u m e n t ( " P a t c h T e s t " ) 
 	 	 b r e a k ; 	 
 } 
                              7�jscr  ��ޭ