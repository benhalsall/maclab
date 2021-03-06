FasdUAS 1.101.10   ��   ��    k             l      ��  ��   

This script assists a user with the setup of his Exchange account
information.

The script is heavily based on EntourageExchangeSerup1.2.scpt by William Smith, mecklists@comcast.net

Modifications by Will Gamble 21 May 2007.

----------------------------------------

Entourage should be configured with the correct preferences -
	Measurement units for printing = centrimetres
	Default address format = United Kingdom
	Dictionary language = English (UK)

and junk email protection configured -
	Level = low
	DONT delete messages from the junk email folder
	Safe domains = leedsmet.ac.uk

No email account profiles should be created. The resulting Microsoft User Data folder
(containing the Entourage database) can then be copied (or aliased) to the documents folder
for each user.

     � 	 	  
 
 T h i s   s c r i p t   a s s i s t s   a   u s e r   w i t h   t h e   s e t u p   o f   h i s   E x c h a n g e   a c c o u n t 
 i n f o r m a t i o n . 
 
 T h e   s c r i p t   i s   h e a v i l y   b a s e d   o n   E n t o u r a g e E x c h a n g e S e r u p 1 . 2 . s c p t   b y   W i l l i a m   S m i t h ,   m e c k l i s t s @ c o m c a s t . n e t 
 
 M o d i f i c a t i o n s   b y   W i l l   G a m b l e   2 1   M a y   2 0 0 7 . 
 
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 
 E n t o u r a g e   s h o u l d   b e   c o n f i g u r e d   w i t h   t h e   c o r r e c t   p r e f e r e n c e s   - 
 	 M e a s u r e m e n t   u n i t s   f o r   p r i n t i n g   =   c e n t r i m e t r e s 
 	 D e f a u l t   a d d r e s s   f o r m a t   =   U n i t e d   K i n g d o m 
 	 D i c t i o n a r y   l a n g u a g e   =   E n g l i s h   ( U K ) 
 
 a n d   j u n k   e m a i l   p r o t e c t i o n   c o n f i g u r e d   - 
 	 L e v e l   =   l o w 
 	 D O N T   d e l e t e   m e s s a g e s   f r o m   t h e   j u n k   e m a i l   f o l d e r 
 	 S a f e   d o m a i n s   =   l e e d s m e t . a c . u k 
 
 N o   e m a i l   a c c o u n t   p r o f i l e s   s h o u l d   b e   c r e a t e d .   T h e   r e s u l t i n g   M i c r o s o f t   U s e r   D a t a   f o l d e r 
 ( c o n t a i n i n g   t h e   E n t o u r a g e   d a t a b a s e )   c a n   t h e n   b e   c o p i e d   ( o r   a l i a s e d )   t o   t h e   d o c u m e n t s   f o l d e r 
 f o r   e a c h   u s e r . 
 
   
  
 l     ��������  ��  ��        l     ��  ��    0 *------------------------------------------     �   T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��    * $ Begin network and server properties     �   H   B e g i n   n e t w o r k   a n d   s e r v e r   p r o p e r t i e s      l     ��  ��    0 *------------------------------------------     �   T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��������  ��  ��        j     �� �� 0 
domainname 
domainName  m          � ! ! $ e x c h a n g e . l m u . a c . u k   " # " l     �� $ %��   $ k e this will be used in conjunction with shortName to create a valid, if somewhat messy, email address.    % � & & �   t h i s   w i l l   b e   u s e d   i n   c o n j u n c t i o n   w i t h   s h o r t N a m e   t o   c r e a t e   a   v a l i d ,   i f   s o m e w h a t   m e s s y ,   e m a i l   a d d r e s s . #  ' ( ' l     ��������  ��  ��   (  ) * ) j    �� +�� 0 windowsdomain WindowsDomain + m     , , � - -  l e e d s m e t . a c . u k *  . / . l     �� 0 1��   0 m g it seems the domain field for Entourage needs to be leedsmet.ac.uk rather than LEEDSMET to work fully.    1 � 2 2 �   i t   s e e m s   t h e   d o m a i n   f i e l d   f o r   E n t o u r a g e   n e e d s   t o   b e   l e e d s m e t . a c . u k   r a t h e r   t h a n   L E E D S M E T   t o   w o r k   f u l l y . /  3 4 3 l     ��������  ��  ��   4  5 6 5 j    �� 7��  0 exchangeserver ExchangeServer 7 m     8 8 � 9 9  L E E D S M E T - E X C H 1 6  : ; : l     ��������  ��  ��   ;  < = < j   	 �� >�� &0 exchangeserverssl ExchangeServerSSL > m   	 
��
�� boovfals =  ? @ ? l     �� A B��   A 9 3 If Exchange users will connect to a backend server    B � C C f   I f   E x c h a n g e   u s e r s   w i l l   c o n n e c t   t o   a   b a c k e n d   s e r v e r @  D E D l     �� F G��   F A ; within the same network then SSL is probably not required.    G � H H v   w i t h i n   t h e   s a m e   n e t w o r k   t h e n   S S L   i s   p r o b a b l y   n o t   r e q u i r e d . E  I J I l     �� K L��   K X R OWA connections will probably require SSL and this setting should be set to true.    L � M M �   O W A   c o n n e c t i o n s   w i l l   p r o b a b l y   r e q u i r e   S S L   a n d   t h i s   s e t t i n g   s h o u l d   b e   s e t   t o   t r u e . J  N O N l     ��������  ��  ��   O  P Q P j    �� R�� .0 exchangeserversslport ExchangeServerSSLPort R m    ���� P Q  S T S l     �� U V��   U 8 2 If ExchangeServerSSL is false set the port to 80.    V � W W d   I f   E x c h a n g e S e r v e r S S L   i s   f a l s e   s e t   t h e   p o r t   t o   8 0 . T  X Y X l     �� Z [��   Z 8 2 If ExchangeServerSSL is true set the port to 443.    [ � \ \ d   I f   E x c h a n g e S e r v e r S S L   i s   t r u e   s e t   t h e   p o r t   t o   4 4 3 . Y  ] ^ ] l     �� _ `��   _ P J Use a different port number only if specified by the email administrator.    ` � a a �   U s e   a   d i f f e r e n t   p o r t   n u m b e r   o n l y   i f   s p e c i f i e d   b y   t h e   e m a i l   a d m i n i s t r a t o r . ^  b c b l     ��������  ��  ��   c  d e d j    �� f�� (0 publicfolderserver PublicFolderServer f m     g g � h h , L E E D S M E T - E X C H 1 / p u b l i c / e  i j i l     ��������  ��  ��   j  k l k j    �� m�� .0 publicfolderserverssl PublicFolderServerSSL m m    ��
�� boovfals l  n o n l     �� p q��   p 9 3 If Exchange users will connect to a backend server    q � r r f   I f   E x c h a n g e   u s e r s   w i l l   c o n n e c t   t o   a   b a c k e n d   s e r v e r o  s t s l     �� u v��   u A ; within the same network then SSL is probably not required.    v � w w v   w i t h i n   t h e   s a m e   n e t w o r k   t h e n   S S L   i s   p r o b a b l y   n o t   r e q u i r e d . t  x y x l     �� z {��   z X R OWA connections will probably require SSL and this setting should be set to true.    { � | | �   O W A   c o n n e c t i o n s   w i l l   p r o b a b l y   r e q u i r e   S S L   a n d   t h i s   s e t t i n g   s h o u l d   b e   s e t   t o   t r u e . y  } ~ } l     ��������  ��  ��   ~   �  j    �� ��� 60 publicfolderserversslport PublicFolderServerSSLPort � m    ���� P �  � � � l     �� � ���   � < 6 If PublicFolderServerSSL is false set the port to 80.    � � � � l   I f   P u b l i c F o l d e r S e r v e r S S L   i s   f a l s e   s e t   t h e   p o r t   t o   8 0 . �  � � � l     �� � ���   � < 6 If PublicFolderServerSSL is true set the port to 443.    � � � � l   I f   P u b l i c F o l d e r S e r v e r S S L   i s   t r u e   s e t   t h e   p o r t   t o   4 4 3 . �  � � � l     �� � ���   � P J Use a different port number only if specified by the email administrator.    � � � � �   U s e   a   d i f f e r e n t   p o r t   n u m b e r   o n l y   i f   s p e c i f i e d   b y   t h e   e m a i l   a d m i n i s t r a t o r . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� 0 
ldapserver 
ldapServer � m     � � � � �  l e e d s m e t - a d s 2 �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � 3 - OWA connections can not use the OWA address.    � � � � Z   O W A   c o n n e c t i o n s   c a n   n o t   u s e   t h e   O W A   a d d r e s s . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� 80 ldaprequiresauthentication LDAPRequiresAuthentication � m    ��
�� boovtrue �  � � � l     �� � ���   � L F This will almost always be true. The LDAP server in a Windows network    � � � � �   T h i s   w i l l   a l m o s t   a l w a y s   b e   t r u e .   T h e   L D A P   s e r v e r   i n   a   W i n d o w s   n e t w o r k �  � � � l     �� � ���   � S M will be a Global Catalog server, which is separate from the Exchange Server.    � � � � �   w i l l   b e   a   G l o b a l   C a t a l o g   s e r v e r ,   w h i c h   i s   s e p a r a t e   f r o m   t h e   E x c h a n g e   S e r v e r . �  � � � l     �� � ���   � E ? OWA connections can not use the OWA address with this setting.    � � � � ~   O W A   c o n n e c t i o n s   c a n   n o t   u s e   t h e   O W A   a d d r e s s   w i t h   t h i s   s e t t i n g . �  � � � l     ��������  ��  ��   �  � � � j     �� ��� 0 ldapserverssl LDAPServerSSL � m    ��
�� boovfals �  � � � l     �� � ���   � 9 3 If Exchange users will connect to a backend server    � � � � f   I f   E x c h a n g e   u s e r s   w i l l   c o n n e c t   t o   a   b a c k e n d   s e r v e r �  � � � l     �� � ���   � A ; within the same network then SSL is probably not required.    � � � � v   w i t h i n   t h e   s a m e   n e t w o r k   t h e n   S S L   i s   p r o b a b l y   n o t   r e q u i r e d . �  � � � l     �� � ���   � E ? OWA connections can not use the OWA address with this setting.    � � � � ~   O W A   c o n n e c t i o n s   c a n   n o t   u s e   t h e   O W A   a d d r e s s   w i t h   t h i s   s e t t i n g . �  � � � l     ��������  ��  ��   �  � � � j   ! %�� ��� &0 ldapserversslport LDAPServerSSLPort � m   ! $����� �  � � � l     �� � ���   � 6 0 If LDAPServerSSL is false set the port to 3268.    � � � � `   I f   L D A P S e r v e r S S L   i s   f a l s e   s e t   t h e   p o r t   t o   3 2 6 8 . �  � � � l     �� � ���   � 5 / If LDAPServerSSL is true set the port to 3269.    � � � � ^   I f   L D A P S e r v e r S S L   i s   t r u e   s e t   t h e   p o r t   t o   3 2 6 9 . �  � � � l     �� � ���   � P J Use a different port number only if specified by the email administrator.    � � � � �   U s e   a   d i f f e r e n t   p o r t   n u m b e r   o n l y   i f   s p e c i f i e d   b y   t h e   e m a i l   a d m i n i s t r a t o r . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � E ? OWA connections can not use the OWA address with this setting.    � � � � ~   O W A   c o n n e c t i o n s   c a n   n o t   u s e   t h e   O W A   a d d r e s s   w i t h   t h i s   s e t t i n g . �  � � � l     ��������  ��  ��   �  � � � j   & *�� ��� (0 ldapmaximumresults LDAPMaximumResults � m   & )���� d �  � � � l     �� � ���   � E ? When searching the Global Address list, this number determines    � � � � ~   W h e n   s e a r c h i n g   t h e   G l o b a l   A d d r e s s   l i s t ,   t h i s   n u m b e r   d e t e r m i n e s �  � � � l     �� � ���   � 0 * the maximum number of entries to display.    � � � � T   t h e   m a x i m u m   n u m b e r   o f   e n t r i e s   t o   d i s p l a y . �  � � � l     ��������  ��  ��   �  � � � j   + /�� ���  0 ldapsearchbase LDAPSearchBase � m   + . � � � � �   �  � � � l     ��������  ��  ��   �  � � � j   0 2�� ��� 0 	scheduled   � m   0 1��
�� boovfals �  � � � l     �� � ��   � Y S Exchange accounts don't require that the "Send & Receive All" schedule be enabled.     � �   E x c h a n g e   a c c o u n t s   d o n ' t   r e q u i r e   t h a t   t h e   " S e n d   &   R e c e i v e   A l l "   s c h e d u l e   b e   e n a b l e d . �  l     ��������  ��  ��    j   3 ?���� 0 errormessage errorMessage b   3 > b   3 :	
	 m   3 6 � : S e t u p   o f   y o u r   a c c o u n t   f a i l e d .
 o   6 9��
�� 
ret  m   : = � � P l e a s e   c o n t a c t   t h e   M a c i n t o s h   a d m i n i s t r a t o r   o n   x 2 6 7 3 6   f o r   a s s i s t a n c e .  l     ��������  ��  ��    l     ����   0 *------------------------------------------    � T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     ����     End server properties    � ,   E n d   s e r v e r   p r o p e r t i e s  l     ����   0 *------------------------------------------    � T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  !  l     ��������  ��  ��  ! "#" l     ��$%��  $ 0 *------------------------------------------   % �&& T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -# '(' l     ��)*��  )   Begin get user name   * �++ (   B e g i n   g e t   u s e r   n a m e( ,-, l     ��./��  . 0 *------------------------------------------   / �00 T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -- 121 l     ��~�}�  �~  �}  2 343 l     �|56�|  5 W Q user information is pulled from the account settings of the current user account   6 �77 �   u s e r   i n f o r m a t i o n   i s   p u l l e d   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   c u r r e n t   u s e r   a c c o u n t4 898 l     �{�z�y�{  �z  �y  9 :;: l      �x<=�x  < � }
tell application "System Events"
	set shortName to name of current user
	set fullName to full name of current user
end tell
   = �>> � 
 t e l l   a p p l i c a t i o n   " S y s t e m   E v e n t s " 
 	 s e t   s h o r t N a m e   t o   n a m e   o f   c u r r e n t   u s e r 
 	 s e t   f u l l N a m e   t o   f u l l   n a m e   o f   c u r r e n t   u s e r 
 e n d   t e l l 
; ?@? l     �w�v�u�w  �v  �u  @ ABA l     �tCD�t  C f ` logging in from NetWare Integrated log in gives user01.usr.context.lmu as full name so do this:   D �EE �   l o g g i n g   i n   f r o m   N e t W a r e   I n t e g r a t e d   l o g   i n   g i v e s   u s e r 0 1 . u s r . c o n t e x t . l m u   a s   f u l l   n a m e   s o   d o   t h i s :B FGF l     �s�r�q�s  �r  �q  G HIH l    J�p�oJ r     KLK m     MM �NN  l m u - n d s 1L o      �n�n 0 
edirserver 
eDirServer�p  �o  I OPO l     �m�l�k�m  �l  �k  P QRQ l   S�j�iS r    TUT I   	�hV�g
�h .sysoexecTEXT���     TEXTV m    WW �XX  / u s r / b i n / w h o a m i�g  U o      �f�f 0 	shortname 	shortName�j  �i  R YZY l     �e�d�c�e  �d  �c  Z [\[ l   ]�b�a] r    ^_^ I   �``�_
�` .sysoexecTEXT���     TEXT` b    aba b    cdc b    efe b    ghg m    ii �jj 4 / u s r / b i n / l d a p s e a r c h   - x   - h  h o    �^�^ 0 
edirserver 
eDirServerf m    kk �ll    - L L L   c n =d o    �]�] 0 	shortname 	shortNameb m    mm �nn    g i v e n N a m e�_  _ o      �\�\ 0 	firstname 	firstName�b  �a  \ opo l     �[�Z�Y�[  �Z  �Y  p qrq l   +s�X�Ws r    +tut I   )�Vv�U
�V .sysoexecTEXT���     TEXTv b    %wxw b    #yzy b    !{|{ b    }~} m     ��� 4 / u s r / b i n / l d a p s e a r c h   - x   - h  ~ o    �T�T 0 
edirserver 
eDirServer| m     �� ���    - L L L   c n =z o   ! "�S�S 0 	shortname 	shortNamex m   # $�� ���    s n�U  u o      �R�R 0 lastname lastName�X  �W  r ��� l     �Q�P�O�Q  �P  �O  � ��� l  , W��N�M� Z   , W���L�� F   , ;��� >  , 1��� n   , /��� 1   - /�K
�K 
leng� o   , -�J�J 0 	firstname 	firstName� m   / 0�I�I  � >  4 9��� n   4 7��� 1   5 7�H
�H 
leng� o   4 5�G�G 0 lastname lastName� m   7 8�F�F  � r   > O��� b   > K��� b   > F��� n   > B��� 4   ? B�E�
�E 
cwor� m   @ A�D�D��� o   > ?�C�C 0 lastname lastName� m   B E�� ���  ,  � n   F J��� 4   G J�B�
�B 
cwor� m   H I�A�A��� o   F G�@�@ 0 	firstname 	firstName� o      �?�? 0 fullname fullName�L  � r   R W��� o   R S�>�> 0 	shortname 	shortName� o      �=�= 0 fullname fullName�N  �M  � ��� l     �<�;�:�<  �;  �:  � ��� l     �9���9  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �8���8  �   End get user name   � ��� $   E n d   g e t   u s e r   n a m e� ��� l     �7���7  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �6�5�4�6  �5  �4  � ��� l     �3���3  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �2���2  � %  Begin email address properties   � ��� >   B e g i n   e m a i l   a d d r e s s   p r o p e r t i e s� ��� l     �1���1  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �0�/�.�0  �/  �.  � ��� l  X g��-�,� r   X g��� b   X c��� b   X ]��� o   X Y�+�+ 0 	shortname 	shortName� m   Y \�� ���  @� o   ] b�*�* 0 
domainname 
domainName� o      �)�) 0 emailaddress emailAddress�-  �,  � ��� l     �(���(  � U O This form of email address should be valid and workable - we will ask the user   � ��� �   T h i s   f o r m   o f   e m a i l   a d d r e s s   s h o u l d   b e   v a l i d   a n d   w o r k a b l e   -   w e   w i l l   a s k   t h e   u s e r� ��� l     �'���'  � B < to change it to the form a.n.other@leedsmet.ac.uk later on.   � ��� x   t o   c h a n g e   i t   t o   t h e   f o r m   a . n . o t h e r @ l e e d s m e t . a c . u k   l a t e r   o n .� ��� l     �&�%�$�&  �%  �$  � ��� l     �#���#  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �"���"  � #  End email address properties   � ��� :   E n d   e m a i l   a d d r e s s   p r o p e r t i e s� ��� l     �!���!  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     � ���   �  �  � ��� l     ����  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ����  �   Begin setup check   � ��� $   B e g i n   s e t u p   c h e c k� ��� l     �� �  � 0 *------------------------------------------     � T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -�  l     ����  �  �    l     ��   M G Is Entourage already configured? This section checks for the existence    � �   I s   E n t o u r a g e   a l r e a d y   c o n f i g u r e d ?   T h i s   s e c t i o n   c h e c k s   f o r   t h e   e x i s t e n c e 	
	 l     ��   J D of an Exchange Server account already in Entourage. It assumes that    � �   o f   a n   E x c h a n g e   S e r v e r   a c c o u n t   a l r e a d y   i n   E n t o u r a g e .   I t   a s s u m e s   t h a t
  l     ��   8 2 users will have only one Exchange Server account.    � d   u s e r s   w i l l   h a v e   o n l y   o n e   E x c h a n g e   S e r v e r   a c c o u n t .  l     ����  �  �    l  h o�� r   h o m   h k �  v o i d o      �� 0 	theanswer 	theAnswer�  �    l     ��   U O The original script didn't declare this = failure if an account doesn't exist!    �   �   T h e   o r i g i n a l   s c r i p t   d i d n ' t   d e c l a r e   t h i s   =   f a i l u r e   i f   a n   a c c o u n t   d o e s n ' t   e x i s t ! !"! l     ����  �  �  " #$# l  p �%�
�	% O   p �&'& Z   v �()��( =  v �*+* l  v �,��, I  v ��-�
� .coredoexbool       obj - 4   v |�.
� 
ExAc. m   z {�� �  �  �  + m   � �� 
�  boovtrue) k   � �// 010 r   � �232 I  � ���45
�� .sysodlogaskr        TEXT4 m   � �66 �77 � E n t o u r a g e   i s   a l r e a d y   c o n f i g u r e d   w i t h   a n   e m a i l   a c c o u n t .   A r e   y o u   s u r e   y o u   w a n t   t o   s e t   u p   a n o t h e r   e m a i l   a c c o u n t ?5 ��89
�� 
btns8 J   � �:: ;<; m   � �== �>>  Y e s< ?��? m   � �@@ �AA , N o ,   j u s t   u s e   E n t o u r a g e��  9 ��BC
�� 
dfltB J   � �DD E��E m   � �FF �GG , N o ,   j u s t   u s e   E n t o u r a g e��  C ��HI
�� 
dispH m   � ����� I ��J��
�� 
apprJ m   � �KK �LL  A l e r t !��  3 o      ���� 0 	theanswer 	theAnswer1 MNM l  � ���������  ��  ��  N OPO l  � ���������  ��  ��  P Q��Q Z   � �RS����R =  � �TUT n   � �VWV 1   � ���
�� 
bhitW o   � ����� 0 	theanswer 	theAnswerU m   � �XX �YY , N o ,   j u s t   u s e   E n t o u r a g eS k   � �ZZ [\[ I  � ���]^
�� .sysodlogaskr        TEXT] m   � �__ �`` � N e x t   t i m e   y o u   w a n t   t o   l a u n c h   E n t o u r a g e   y o u   c a n   l a u n c h   i t   f r o m   t h e   d o c k   i c o n .^ ��ab
�� 
btnsa J   � �cc d��d m   � �ee �ff  O K��  b ��gh
�� 
dfltg J   � �ii j��j m   � �kk �ll  O K��  h ��mn
�� 
dispm m   � ����� n ��o��
�� 
appro m   � �pp �qq . F o r   y o u r   i n f o r m a t i o n . . .��  \ r��r l  � �stus L   � �����  t   exits the script   u �vv "   e x i t s   t h e   s c r i p t��  ��  ��  ��  �  �  ' m   p sww                                                                                  OPIM   alis    �  Studio                     �1�H+  �*Microsoft Entourage.app                                        j�v�v        ����  	                Microsoft Office 2008     �1�      �v�v    �* 	�d  AStudio:Applications:Microsoft Office 2008:Microsoft Entourage.app   0  M i c r o s o f t   E n t o u r a g e . a p p    S t u d i o  :Applications/Microsoft Office 2008/Microsoft Entourage.app  / ��  �
  �	  $ xyx l     ��������  ��  ��  y z{z l     ��|}��  | 0 *------------------------------------------   } �~~ T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -{ � l     ������  �   End setup check   � ���     E n d   s e t u p   c h e c k� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   Begin account setup   � ��� (   B e g i n   a c c o u n t   s e t u p� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l  �x������ Q   �x���� k   �O�� ��� l  � ���������  ��  ��  � ��� r   ���� I  �����
�� .sysodlogaskr        TEXT� m   � ��� ��� b P l e a s e   v e r i f y   t h a t   y o u r   e m a i l   a d d r e s s   i s   c o r r e c t :� ����
�� 
dtxt� o   � ����� 0 emailaddress emailAddress� ����
�� 
btns� J   ��� ��� m   � �� ���  C a n c e l� ���� m   �� ���  O K��  � �����
�� 
dflt� J  �� ���� m  �� ���  O K��  ��  � o      ���� 0 verifyemail verifyEmail� ��� r  #��� n  ��� 1  ��
�� 
ttxt� o  ���� 0 verifyemail verifyEmail� o      ���� 0 emailaddress emailAddress� ��� l $$��������  ��  ��  � ��� I $f����
�� .sysodlogaskr        TEXT� b  $M��� b  $I��� b  $E��� b  $A��� b  $?��� b  $;��� b  $7��� b  $3��� b  $/��� b  $+��� m  $'�� ��� � E n t o u r a g e   w i l l   b e   c o n f i g u r e d   f o r   y o u   u s i n g   t h e   f o l l o w i n g   s e t t i n g s :� o  '*��
�� 
ret � o  +.��
�� 
ret � m  /2�� ���  "   Y o u r   n a m e :  � o  36���� 0 fullname fullName� o  7:��
�� 
ret � m  ;>�� ���   "   Y o u r   u s e r   I D :  � o  ?@���� 0 	shortname 	shortName� o  AD��
�� 
ret � m  EH�� ��� , "   Y o u r   e m a i l   a d d r e s s :  � o  IL���� 0 emailaddress emailAddress� ����
�� 
btns� J  PX�� ��� m  PS�� ���  C a n c e l� ���� m  SV�� ���  O K��  � �����
�� 
dflt� J  [`�� ���� m  [^�� ���  O K��  ��  � ��� l gg��������  ��  ��  � ��� O  gM��� k  mL�� ��� I mr������
�� .miscactvnull��� ��� null��  ��  � ��� I s���� 
�� .corecrel****      � null��    ��
�� 
kocl m  wz��
�� 
ExAc ����
�� 
prdt K  } ��
�� 
pnam b  �� m  ��		 �

  M a i l b o x   -   o  ������ 0 fullname fullName ��
�� 
ExID o  ������ 0 	shortname 	shortName ��
�� 
ExDo o  ������ 0 windowsdomain WindowsDomain ��
�� 
fulN o  ������ 0 fullname fullName ��
�� 
cEmA o  ������ 0 emailaddress emailAddress ��
�� 
LDSb o  ������  0 ldapsearchbase LDAPSearchBase ��
�� 
pDSS K  �� ��
�� 
addr o  ������  0 exchangeserver ExchangeServer ��
�� 
SrvR o  ������ &0 exchangeserverssl ExchangeServerSSL ����
�� 
ppor o  ������ .0 exchangeserversslport ExchangeServerSSLPort��   ��
�� 
pPSS K  �� �� !
�� 
addr  o  ������ (0 publicfolderserver PublicFolderServer! ��"#
�� 
SrvR" o  ������ .0 publicfolderserverssl PublicFolderServerSSL# ��$��
�� 
ppor$ o  ������ 60 publicfolderserversslport PublicFolderServerSSLPort��   ��%��
�� 
pLSS% K  �&& ��'(
�� 
addr' o  ������ 0 
ldapserver 
ldapServer( ��)*
�� 
rqAt) o  ������ 80 ldaprequiresauthentication LDAPRequiresAuthentication* ��+,
�� 
SrvR+ o  � ���� 0 ldapserverssl LDAPServerSSL, �-.
� 
ppor- o  �~�~ &0 ldapserversslport LDAPServerSSLPort. �}/�|
�} 
LDMx/ o  �{�{ (0 ldapmaximumresults LDAPMaximumResults�|  ��  ��  � 010 Q  723�z2 I ".�y4�x
�y .coreclosnull���    obj 4 4  "*�w5
�w 
cwin5 m  &)66 �77 2 E n t o u r a g e   S e t u p   A s s i s t a n t�x  3 R      �v�u�t
�v .ascrerr ****      � ****�u  �t  �z  1 898 l 88�s�r�q�s  �r  �q  9 :;: r  8J<=< o  8=�p�p 0 	scheduled  = n      >?> 1  EI�o
�o 
enbl? 4  =E�n@
�n 
cSch@ m  ADAA �BB $ S e n d   &   R e c e i v e   A l l; C�mC l KK�l�k�j�l  �k  �j  �m  � m  gjDD                                                                                  OPIM   alis    �  Studio                     �1�H+  �*Microsoft Entourage.app                                        j�v�v        ����  	                Microsoft Office 2008     �1�      �v�v    �* 	�d  AStudio:Applications:Microsoft Office 2008:Microsoft Entourage.app   0  M i c r o s o f t   E n t o u r a g e . a p p    S t u d i o  :Applications/Microsoft Office 2008/Microsoft Entourage.app  / ��  � E�iE l NN�h�g�f�h  �g  �f  �i  � R      �e�d�c
�e .ascrerr ****      � ****�d  �c  � k  WxFF GHG l WW�b�a�`�b  �a  �`  H IJI I Wv�_KL
�_ .sysodlogaskr        TEXTK o  W\�^�^ 0 errormessage errorMessageL �]MN
�] 
dispM m  _`�\�\ N �[OP
�[ 
btnsO J  chQQ R�ZR m  cfSS �TT  O K�Z  P �YU�X
�Y 
dfltU J  kpVV W�WW m  knXX �YY  O K�W  �X  J Z�VZ l ww�U�T�S�U  �T  �S  �V  ��  ��  � [\[ l     �R�Q�P�R  �Q  �P  \ ]^] l     �O_`�O  _ 0 *------------------------------------------   ` �aa T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -^ bcb l     �Nde�N  d   End account setup   e �ff $   E n d   a c c o u n t   s e t u pc g�Mg l     �Lhi�L  h 0 *------------------------------------------   i �jj T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -�M       �Kk   , 8�J�I g�H�G ��F�E�D�C ��Blm�K  k �A�@�?�>�=�<�;�:�9�8�7�6�5�4�3�2�1�A 0 
domainname 
domainName�@ 0 windowsdomain WindowsDomain�?  0 exchangeserver ExchangeServer�> &0 exchangeserverssl ExchangeServerSSL�= .0 exchangeserversslport ExchangeServerSSLPort�< (0 publicfolderserver PublicFolderServer�; .0 publicfolderserverssl PublicFolderServerSSL�: 60 publicfolderserversslport PublicFolderServerSSLPort�9 0 
ldapserver 
ldapServer�8 80 ldaprequiresauthentication LDAPRequiresAuthentication�7 0 ldapserverssl LDAPServerSSL�6 &0 ldapserversslport LDAPServerSSLPort�5 (0 ldapmaximumresults LDAPMaximumResults�4  0 ldapsearchbase LDAPSearchBase�3 0 	scheduled  �2 0 errormessage errorMessage
�1 .aevtoappnull  �   � ****
�J boovfals�I P
�H boovfals�G P
�F boovtrue
�E boovfals�D��C d
�B boovfalsl �nn � S e t u p   o f   y o u r   a c c o u n t   f a i l e d .  P l e a s e   c o n t a c t   t h e   M a c i n t o s h   a d m i n i s t r a t o r   o n   x 2 6 7 3 6   f o r   a s s i s t a n c e .m �0o�/�.pq�-
�0 .aevtoappnull  �   � ****o k    xrr Hss Qtt [uu qvv �ww �xx yy #zz ��,�,  �/  �.  p  q ZM�+W�*�)ikm�(���'�&�%�$��#��"�!w� �6�=@�F��K���X_ekp���������������������	����
�	��������� ������6��������A��SX�+ 0 
edirserver 
eDirServer
�* .sysoexecTEXT���     TEXT�) 0 	shortname 	shortName�( 0 	firstname 	firstName�' 0 lastname lastName
�& 
leng
�% 
bool
�$ 
cwor�# 0 fullname fullName�" 0 emailaddress emailAddress�! 0 	theanswer 	theAnswer
�  
ExAc
� .coredoexbool       obj 
� 
btns
� 
dflt
� 
disp
� 
appr� 
� .sysodlogaskr        TEXT
� 
bhit
� 
dtxt� � 0 verifyemail verifyEmail
� 
ttxt
� 
ret � 
� .miscactvnull��� ��� null
� 
kocl
� 
prdt
� 
pnam
� 
ExID
� 
ExDo
� 
fulN
�
 
cEmA
�	 
LDSb
� 
pDSS
� 
addr
� 
SrvR
� 
ppor
� 
pPSS
� 
pLSS
� 
rqAt
� 
LDMx�  
�� 
�� .corecrel****      � null
�� 
cwin
�� .coreclosnull���    obj ��  ��  
�� 
cSch
�� 
enbl�-y�E�O�j E�O��%�%�%�%j E�O��%�%�%�%j E�O��,j	 	��,j�& ��i/a %��i/%E` Y �E` O�a %b   %E` Oa E` Oa  x*a k/j e  ha a a a lva a kva la  a !a " #E` O_ a $,a %  +a &a a 'kva a (kva ka  a )a " #OhY hY hUOca *a +_ a a ,a -lva a .kva / #E` 0O_ 0a 1,E` Oa 2_ 3%_ 3%a 4%_ %_ 3%a 5%�%_ 3%a 6%_ %a a 7a 8lva a 9kva : #Oa  �*j ;O*a <a a =a >a ?_ %a @�a Ab  a B_ a C_ a Db  a Ea Fb  a Gb  a Hb  a /a Ia Fb  a Gb  a Hb  a /a Ja Fb  a Kb  	a Gb  
a Hb  a Lb  a Ma Na : OO *a Pa Q/j RW X S ThOb  *a Ua V/a W,FOPUOPW (X S Tb  a la a Xkva a Ykva / #OPascr  ��ޭ