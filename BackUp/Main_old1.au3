#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <_HttpRequest.au3>
#include <pause.au3>

#Region ### START Koda GUI section ### Form=C:\Users\htth2\Desktop\AutoZing\Form1.kxf
$Form1 = GUICreate("AutoRechargeZing ver 1.0.0 - by Tran Thanh Hung", 609, 402, 360, 159)
GUISetFont(10, 400, 0, "MS Sans Serif")
GUISetBkColor(0x646464, $Form1)

$ListView1 = GUICtrlCreateListView("", 248, 80, 217, 305, BitOR($ES_AUTOVSCROLL, $ES_READONLY, $WS_VSCROLL))
GUICtrlSetData(-1, '')
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)

$LAccount = GUICtrlCreateLabel("Account:", 16, 24, 63, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, "-2")

$LPassword = GUICtrlCreateLabel("Password:", 240, 24, 76, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, "-2")

$Account = GUICtrlCreateInput("", 80, 24, 137, 21)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)

$Password = GUICtrlCreateInput("", 320, 24, 145, 21)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)

$Edit1 = GUICtrlCreateEdit("", 16, 80, 201, 305, BitOR($ES_AUTOVSCROLL, $ES_READONLY, $WS_VSCROLL))
GUICtrlSetData(-1, '')
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)

$Label3 = GUICtrlCreateLabel("STATUS", 72, 56, 73, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)

$Label4 = GUICtrlCreateLabel("RESULT", 320, 56, 74, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)

$BLogin = GUICtrlCreateButton("LOGIN", 504, 16, 81, 33)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd

;==============================_Text============================
Func _Text($txt)
	GUICtrlSetData($Edit1,$txt & @CRLF, 1)
EndFunc

;==============================_Login============================
Func _Login()
	$acc=GUICtrlRead($Account)
	$pass=GUICtrlRead($Password)
	$login=_HttpRequest(2,'https://sso3.zing.vn/alogin','apikey=6e731b7ae5ca4146a880d7b956eb3649&pid=12&longtime=1&u='&$acc&'&p='&$pass&'&u1=https://pay.zing.vn/product/tanthienlong3d&fp=https://pay.zing.vn/wplogin/pc/tanthienlong3d','','https://pay.zing.vn/wplogin/pc/tanthienlong3d','Upgrade-Insecure-Requests: 1')
	$accountID=StringRegExp($login,'var accountID="(.*?)";',1)
	If @error Then
		_Text('[THẤT BẠI] Sai tên đăng nhập hoặc mật khẩu.'&@CRLF&'Vui lòng đăng nhập lại!')
	Else
		$accountGuid=StringRegExp($login,'var accountGuid="(.*?)";',1)
	$serverID=StringRegExp($login,',"serverID":"(.*?)","',1)
	$sID=StringRegExp($login,'\{"sID":(.*?),"',1)
	$load_payment=_HttpRequest(1,'https://pay.zing.vn/ajax/check-account?productCode=tanthienlong3d&accountName='&$acc&'&accountID='&$accountID[0]&'&accountGuid='&$accountGuid[0]&'&serverID='&$serverID[0]&'&roleID=','','','https://pay.zing.vn/product/tanthienlong3d?mess=succ&u='&$acc&'','X-Requested-With: XMLHttpRequest')
	$load7=_HttpRequest(2,'https://pay.zing.vn/payment/tanthienlong3d','sID='&$sID&'&serverID=all&pmOptID=35&pmcID=1&roleID=&roleName=&accountName='&$acc&'','','https://pay.zing.vn/product/tanthienlong3d?mess=succ&u='&$acc&'','Upgrade-Insecure-Requests: 1')
	EndIf
EndFunc
;==============================_Recharge============================
;==============================_Logout============================
;==============================_Text============================
;==============================_Text============================