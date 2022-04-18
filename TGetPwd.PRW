#INCLUDE "TOTVS.CH"

#Define CSS_DEFAULT "QPushButton {"+;
" color: black;"+;
" background-color: blue;"+;
" border-style: solid;"+;
" border-width: 1px;"+;
" border-color: gray;"+;
" border-radius: 15px;"+;
" }"+;
" QPushButton:hover {"+;
" background-color: lightblue;"+;
" border-style: solid;"+;
" border-width: 1px;"+;
" border-color: black;"+;
" border-radius: 15px;"+;
" }"

#Define CSS_PWD "QPushButton { background-image: url(rpo:olho.png);"+;
" background-size: contain; background-position: center; background-repeat: no-repeat; "+;
" border: 1px none transparent; }"+;
" QPushButton:hover { background-image: url(rpo:olho_fechado.png); background-size: contain; background-position: center; background-repeat: no-repeat; }"
 
User Function xGetPwd()
Local cPwd := Space(6)
// Local oWnd:= TWindow():New(0, 0, 500, 400, "Controle de Acesso", NIL, NIL, NIL, NIL, NIL, NIL, NIL,;
// 	CLR_BLACK, CLR_WHITE, NIL, NIL, NIL, NIL, NIL, NIL, .T. )

DEFINE DIALOG oDlg TITLE ("Digite sua senha!") FROM 0,0 TO 150,450 PIXEL //COLOR CLR_WHITE, CLR_BROWN
	@ 10,05 SAY oSay2 PROMPT "Senha" RIGHT SIZE 40,12 OF oDlg PIXEL
	oGetPsw:= TGetPwd():New(10,50,{||cPwd},oDlg,150,12,,,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cPwd,,,,)
	oBtn01 := TButton():new(30,50,"F",oDlg,{||oDlg:End()},15,15,,,,.T.,,,,,,)
	oBtn01:setCSS(CSS_DEFAULT)
ACTIVATE DIALOG oDlg CENTER
Return

CLASS TGetPwd FROM TGET
	METHOD New() CONSTRUCTOR
ENDCLASS

METHOD New(nTop,nLeft,bSetGet,oWnd,nWidth,nHight,cPicture,bValid,anClrFore,anClrBack,oFont,lDesign,aoCursor,alPixel,acMsg,alUpdate,bWhen,alCenter,alRight,abChange,alReadOnly,alPassword,cLookUp,acReadVar,acSX1Help,cField,alNoBorder,anHelpId,alHasButton,alNoButton) CLASS TGetPwd
 	:New(nTop,nLeft,bSetGet,oWnd,nWidth,nHight,cPicture,bValid,anClrFore,anClrBack,oFont,lDesign,aoCursor,alPixel,acMsg,alUpdate,bWhen,alCenter,alRight,abChange,alReadOnly,.T.,cLookUp,acReadVar,acSX1Help,cField,alNoBorder,anHelpId,alHasButton,alNoButton)
	Local oBtnVer := TButton():new(nTop+1,nLeft+nWidth-nHight-2," ",oWnd,{||self:lPassword:=!self:lPassword},nHight,nHight,,oFont,,alPixel,,,,bWhen,,)
	oBtnVer:lCanGotFocus := .F.
	oBtnVer:setCSS(CSS_PWD)
RETURN self
