FasdUAS 1.101.10   ��   ��    k             l     ��  ��    1 + `menu_click`, by Jacob Rus, September 2006     � 	 	 V   ` m e n u _ c l i c k ` ,   b y   J a c o b   R u s ,   S e p t e m b e r   2 0 0 6   
  
 l     ��  ��           �           l     ��  ��    I C Accepts a list of form: `{"Finder", "View", "Arrange By", "Date"}`     �   �   A c c e p t s   a   l i s t   o f   f o r m :   ` { " F i n d e r " ,   " V i e w " ,   " A r r a n g e   B y " ,   " D a t e " } `      l     ��  ��    K E Execute the specified menu item.  In this case, assuming the Finder      �   �   E x e c u t e   t h e   s p e c i f i e d   m e n u   i t e m .     I n   t h i s   c a s e ,   a s s u m i n g   t h e   F i n d e r        l     ��  ��    I C is the active application, arranging the frontmost folder by date.     �   �   i s   t h e   a c t i v e   a p p l i c a t i o n ,   a r r a n g i n g   t h e   f r o n t m o s t   f o l d e r   b y   d a t e .      l     ��������  ��  ��       !   i      " # " I      �� $���� 0 
menu_click   $  %�� % o      ���� 0 mlist mList��  ��   # k     T & &  ' ( ' q       ) ) �� *�� 0 appname appName * �� +�� 0 topmenu topMenu + ������ 0 r  ��   (  , - , l     ��������  ��  ��   -  . / . l     �� 0 1��   0   Validate our input    1 � 2 2 &   V a l i d a t e   o u r   i n p u t /  3 4 3 Z     5 6���� 5 A      7 8 7 n     9 : 9 1    ��
�� 
leng : o     ���� 0 mlist mList 8 m    ����  6 R    �� ;��
�� .ascrerr ****      � **** ; m   
  < < � = = 8 M e n u   l i s t   i s   n o t   l o n g   e n o u g h��  ��  ��   4  > ? > l   ��������  ��  ��   ?  @ A @ l   �� B C��   B ; 5 Set these variables for clarity and brevity later on    C � D D j   S e t   t h e s e   v a r i a b l e s   f o r   c l a r i t y   a n d   b r e v i t y   l a t e r   o n A  E F E r    + G H G l    I���� I n     J K J 7  �� L M
�� 
cobj L m    ����  M m    ����  K o    ���� 0 mlist mList��  ��   H J       N N  O P O o      ���� 0 appname appName P  Q�� Q o      ���� 0 topmenu topMenu��   F  R S R r   , ; T U T l  , 9 V���� V n   , 9 W X W 7 - 9�� Y Z
�� 
cobj Y m   1 3����  Z l  4 8 [���� [ n  4 8 \ ] \ 1   6 8��
�� 
leng ] o   4 6���� 0 mlist mList��  ��   X o   , -���� 0 mlist mList��  ��   U o      ���� 0 r   S  ^ _ ^ l  < <��������  ��  ��   _  ` a ` l  < <�� b c��   b A ; This overly-long line calls the menu_recurse function with    c � d d v   T h i s   o v e r l y - l o n g   l i n e   c a l l s   t h e   m e n u _ r e c u r s e   f u n c t i o n   w i t h a  e f e l  < <�� g h��   g > 8 two arguments: r, and a reference to the top-level menu    h � i i p   t w o   a r g u m e n t s :   r ,   a n d   a   r e f e r e n c e   t o   t h e   t o p - l e v e l   m e n u f  j�� j O  < T k l k n  @ S m n m I   A S�� o���� 0 menu_click_recurse   o  p q p o   A B���� 0 r   q  r�� r l  B O s���� s n  B O t u t l  L O v���� v 4   L O�� w
�� 
menE w o   M N���� 0 topmenu topMenu��  ��   u n  B L x y x l  I L z���� z 4   I L�� {
�� 
mbri { o   J K���� 0 topmenu topMenu��  ��   y n  B I | } | l 	 F I ~���� ~ l  F I ����  4   F I�� �
�� 
mbar � m   G H���� ��  ��  ��  ��   } l  B F ����� � 4   B F�� �
�� 
prcs � o   D E���� 0 appname appName��  ��  ��  ��  ��  ��   n  f   @ A l m   < = � �                                                                                  sevs  alis    �  I keep getting healthier.  ��@MH+  �:CSystem Events.app                                              ��A`�        ����  	                CoreServices    �٢�      �A�9    �:C�:@�:?  JI keep getting healthier.:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p  4  I   k e e p   g e t t i n g   h e a l t h i e r .  -System/Library/CoreServices/System Events.app   / ��  ��   !  � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� 0 menu_click_recurse   �  � � � o      ���� 0 mlist mList �  ��� � o      ���� 0 parentobject parentObject��  ��   � k     H � �  � � � q       � � �� ��� 0 f   � ������ 0 r  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � , & `f` = first item, `r` = rest of items    � � � � L   ` f `   =   f i r s t   i t e m ,   ` r `   =   r e s t   o f   i t e m s �  � � � r      � � � n      � � � 4    �� �
�� 
cobj � m    ����  � o     ���� 0 mlist mList � o      ���� 0 f   �  � � � Z   " � ����� � ?     � � � n   
 � � � 1    
��
�� 
leng � o    ���� 0 mlist mList � m   
 ����  � r     � � � l    ����� � n     � � � 7  �� � �
�� 
cobj � m    ����  � l    ����� � n    � � � 1    ��
�� 
leng � o    ���� 0 mlist mList��  ��   � o    ���� 0 mlist mList��  ��   � o      ���� 0 r  ��  ��   �  � � � l  # #��������  ��  ��   �  � � � l  # #�� � ���   � < 6 either actually click the menu item, or recurse again    � � � � l   e i t h e r   a c t u a l l y   c l i c k   t h e   m e n u   i t e m ,   o r   r e c u r s e   a g a i n �  ��� � O   # H � � � Z   ' G � ��� � � =  ' , � � � n  ' * � � � 1   ( *��
�� 
leng � o   ' (���� 0 mlist mList � m   * +����  � I  / 7�� ���
�� .prcsclicnull��� ��� uiel � n  / 3 � � � 4   0 3�� �
�� 
menI � o   1 2���� 0 f   � o   / 0�� 0 parentobject parentObject��  ��   � n  : G � � � I   ; G�~ ��}�~ 0 menu_click_recurse   �  � � � o   ; <�|�| 0 r   �  ��{ � l  < C ��z�y � n  < C � � � l  @ C ��x�w � 4   @ C�v �
�v 
menE � o   A B�u�u 0 f  �x  �w   � n  < @ � � � l  = @ ��t�s � 4   = @�r �
�r 
menI � o   > ?�q�q 0 f  �t  �s   � o   < =�p�p 0 parentobject parentObject�z  �y  �{  �}   �  f   : ; � m   # $ � �                                                                                  sevs  alis    �  I keep getting healthier.  ��@MH+  �:CSystem Events.app                                              ��A`�        ����  	                CoreServices    �٢�      �A�9    �:C�:@�:?  JI keep getting healthier.:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p  4  I   k e e p   g e t t i n g   h e a l t h i e r .  -System/Library/CoreServices/System Events.app   / ��  ��   �  � � � l     �o�n�m�o  �n  �m   �  � � � l     �l�k�j�l  �k  �j   �  � � � l    
 ��i�h � O    
 � � � I   	�g�f�e
�g .miscactvnull��� ��� null�f  �e   � m      � ��                                                                                  keyn  alis    �  I keep getting healthier.  ��@MH+   
�Keynote.app                                                     
����^        ����  	                	iWork '09     �٢�      ��u�     
��:e  >I keep getting healthier.:Applications: iWork '09: Keynote.app    K e y n o t e . a p p  4  I   k e e p   g e t t i n g   h e a l t h i e r .  "Applications/iWork '09/Keynote.app  / ��  �i  �h   �  � � � l     �d�c�b�d  �c  �b   �  ��a � l    ��`�_ � I    �^ ��]�^ 0 
menu_click   �  ��\ � J     � �  � � � m     � � � � �  K e y n o t e �  � � � m     � � � � �  F i l e �  � � � m     � � � � �  E x p o r t �  ��[ � m     � � � � �  P D F &�[  �\  �]  �`  �_  �a       �Z � � � ��Z   � �Y�X�W�Y 0 
menu_click  �X 0 menu_click_recurse  
�W .aevtoappnull  �   � **** � �V #�U�T � ��S�V 0 
menu_click  �U �R ��R  �  �Q�Q 0 mlist mList�T   � �P�O�N�M�P 0 mlist mList�O 0 appname appName�N 0 topmenu topMenu�M 0 r   � 	�L <�K ��J�I�H�G�F
�L 
leng
�K 
cobj
�J 
prcs
�I 
mbar
�H 
mbri
�G 
menE�F 0 menu_click_recurse  �S U��,m 	)j�Y hO�[�\[Zk\Zl2E[�k/E�Z[�l/E�ZO�[�\[Zm\Z��,2E�O� )�*�/�k/�/�/l+ U � �E ��D�C � �B�E 0 menu_click_recurse  �D �A�A   �@�?�@ 0 mlist mList�? 0 parentobject parentObject�C   � �>�=�<�;�> 0 mlist mList�= 0 parentobject parentObject�< 0 f  �; 0 r    �:�9 ��8�7�6�5
�: 
cobj
�9 
leng
�8 
menI
�7 .prcsclicnull��� ��� uiel
�6 
menE�5 0 menu_click_recurse  �B I��k/E�O��,k �[�\[Zl\Z��,2E�Y hO� "��,k  ��/j Y )���/�/l+ U � �4�3�2�1
�4 .aevtoappnull  �   � **** k       �  ��0�0  �3  �2      ��/ � � � ��.�-
�/ .miscactvnull��� ��� null�. �- 0 
menu_click  �1 � *j UO*�����vk+ ascr  ��ޭ