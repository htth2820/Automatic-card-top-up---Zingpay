#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <GUIListView.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <_HttpRequest.au3>
#include <pause.au3>
#include <File.au3>
#include <about.au3>

#Region ### START Koda GUI section ### Form=C:\Users\htth2\Desktop\AutoZing\Form1.kxf
$Form1 = GUICreate("AutoRechargeZing ver 1.0.0 - by Tran Thanh Hung", 609, 402, 360, 159)
GUISetFont(10, 400, 0, "MS Sans Serif")
GUISetBkColor(0x646464, $Form1)

$ListView1 = GUICtrlCreateListView("Serial|CardCode|Status", 230, 80, 270, 305, BitOR($ES_AUTOVSCROLL, $ES_READONLY, $WS_VSCROLL))
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 105)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 90)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 2, 71)
_GUICtrlListView_JustifyColumn(GUICtrlGetHandle($ListView1), 0, 2)
_GUICtrlListView_JustifyColumn(GUICtrlGetHandle($ListView1), 1, 2)
_GUICtrlListView_JustifyColumn(GUICtrlGetHandle($ListView1), 2, 2)
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)
;_GUICtrlListView_DeleteAllItems($ListView1)
;GUICtrlCreateListViewItem($split_data[3] & '|' & $sub_data[2] & '|' & 'Thất Bại', $ListView1)
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

$BLogin = GUICtrlCreateButton("LOGIN", 520, 20, 81, 33)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)

$instruc = GUICtrlCreateButton("Instruction", 520, 100, 81, 33)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)

$recharge = GUICtrlCreateButton("Recharge", 520, 260, 81, 33)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)

$open = GUICtrlCreateButton("Open", 520, 180, 81, 33)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)

$about = GUICtrlCreateButton("About", 520, 340, 81, 33)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $BLogin
			_Login()
		Case $instruc
		Case $open
			$file = FileOpenDialog('Choose the file .txt', @ScriptDir & '\', 'Text (*.txt)', BitOR($FD_FILEMUSTEXIST, $FD_MULTISELECT))
			_Text('[OPEN] Load danh sách mã nạp thành công!')
		Case $recharge
			_Rec1()
		Case $about
			_showAboutDialog('Auto Recharge Zing Pay', '1.0.0', 'Trần Thanh Hùng', Default, Default, 'https://www.facebook.com/darrenhtth')
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd

;$file = FileOpenDialog
;==============================_Text============================
Func _Text($txt)
	GUICtrlSetData($Edit1, $txt & @CRLF, 1)
EndFunc   ;==>_Text

;==============================_Login============================
Func _Login()
	Global $acc = GUICtrlRead($Account)
	$pass = GUICtrlRead($Password)
	$login = _HttpRequest(2, 'https://sso3.zing.vn/alogin', 'apikey=6e731b7ae5ca4146a880d7b956eb3649&pid=12&longtime=1&u=' & $acc & '&p=' & $pass & '&u1=https://pay.zing.vn/product/tanthienlong3d&fp=https://pay.zing.vn/wplogin/pc/tanthienlong3d', '', 'https://pay.zing.vn/wplogin/pc/tanthienlong3d', 'Upgrade-Insecure-Requests: 1')
	$accountID = StringRegExp($login, 'var accountID="(.*?)";', 1)
	If @error Then
		_Text('[LOGIN] Sai tên đăng nhập hoặc mật khẩu.' & @CRLF & 'Vui lòng đăng nhập lại!')
	Else
		$accountGuid = StringRegExp($login, 'var accountGuid="(.*?)";', 1)
		$serverID = StringRegExp($login, ',"serverID":"(.*?)","', 1)
		Global $sID = StringRegExp($login, '\{"sID":(.*?),"', 1)
		$load_payment = _HttpRequest(1, 'https://pay.zing.vn/ajax/check-account?productCode=tanthienlong3d&accountName=' & $acc & '&accountID=' & $accountID[0] & '&accountGuid=' & $accountGuid[0] & '&serverID=' & $serverID[0] & '&roleID=', '', '', 'https://pay.zing.vn/product/tanthienlong3d?mess=succ&u=' & $acc & '', 'X-Requested-With: XMLHttpRequest')
		$login_success = _HttpRequest(2, 'https://pay.zing.vn/payment/tanthienlong3d', 'sID=' & $sID[0] & '&serverID=all&pmOptID=35&pmcID=1&roleID=&roleName=&accountName=' & $acc & '', '', 'https://pay.zing.vn/product/tanthienlong3d?mess=succ&u=' & $acc & '', 'Upgrade-Insecure-Requests: 1')
		$name = StringRegExp($login_success, 'class="fr">Xin chào(.*?) <a href=', 1)
		If @error Then
			_Text('[LOGIN] Lỗi không xác định, vui lòng thử lại sau.')
		Else
			_Text('[LOGIN] Đăng nhập thành công!' & @CRLF & 'Xin chào' & $name[0])
			GUICtrlSetData($BLogin, 'LOGOUT')
		EndIf
	EndIf
EndFunc   ;==>_Login

;==============================_Recharge============================
Func _Rec1()
	For $i = 1 To _FileCountLines($file) Step 2
		$aserial = StringSplit(FileReadLine($file, $i + 1), ':')
		$serial = StringReplace($aserial[2], '-', '')
				If StringLen($serial) <> 12 Then
			_Text('Thẻ ' & $i & ': Số seri không hợp lệ')
			GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
		Else
		$acardpass = StringSplit(FileReadLine($file, $i), ':')
		$cardpass = StringReplace($acardpass[2], '-', '')
		$rec = _HttpRequest(2, 'https://pay.zing.vn/ajax/payment-zingcard', 'pmcID=1&pmOptID=35&sID=' & $sID[0] & '&roleID=&roleName=&productCode=tanthienlong3d&cardSerial=' & $serial & '&cardPassword=' & $cardpass & '&accountName=' & $acc & '', '', 'https://pay.zing.vn/payment/tanthienlong3d', 'X-Requested-With: XMLHttpRequest')
		$aID = StringRegExp($rec, '"transID":(.*?)\}', 1)
		$link_cf = 'https://new.pay.zing.vn/result/tanthienlong3d/' & $aID[0]
		$cf = _HttpRequest(2, $link_cf, 'pmcID=1&pmOptID=35', '', 'https://new.pay.zing.vn/payment/tanthienlong3d', 'Upgrade-Insecure-Requests: 1')
		$result = _HttpRequest(2, 'https://new.pay.zing.vn/ajax/get-result', 'transID=' & $aID[0], '', $link_cf, 'X-Requested-With: XMLHttpRequest')
		If StringInStr($result, 'Thẻ đã được sử dụng') > 0 Then
			_Text('Thẻ ' & $i & ": Thẻ đã được sử dụng")
			GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
		ElseIf StringInStr($result, 'Sai mật mã thẻ') > 0 Then
			_Text('Thẻ ' & $i & ': Sai mật mã thẻ')
			GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
		Else
			_Text('Thẻ ' & $i & ': Nạp thẻ thành công')
			GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Successed', $ListView1)
		EndIf
		EndIf
	Next
EndFunc   ;==>_Rec1
;==============================_Reg2============================
Func _Rec2()
	For $i = 1 To _FileCountLines($file) Step 1
		$code = StringSplit(FileReadLine($file, $i), ' ')
		$serial = $code[2]
		If StringLen($serial) <> 12 Then
			_Text('Thẻ ' & $i & ': Số seri không hợp lệ')
			GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
		Else
			$cardpass = $code[1]
			$rec = _HttpRequest(2, 'https://pay.zing.vn/ajax/payment-zingcard', 'pmcID=1&pmOptID=35&sID=' & $sID[0] & '&roleID=&roleName=&productCode=tanthienlong3d&cardSerial=' & $serial & '&cardPassword=' & $cardpass & '&accountName=' & $acc & '', '', 'https://pay.zing.vn/payment/tanthienlong3d', 'X-Requested-With: XMLHttpRequest')
			$aID = StringRegExp($rec, '"transID":(.*?)\}', 1)
			$link_cf = 'https://new.pay.zing.vn/result/tanthienlong3d/' & $aID[0]
			$cf = _HttpRequest(2, $link_cf, 'pmcID=1&pmOptID=35', '', 'https://new.pay.zing.vn/payment/tanthienlong3d', 'Upgrade-Insecure-Requests: 1')
			$result = _HttpRequest(2, 'https://new.pay.zing.vn/ajax/get-result', 'transID=' & $aID[0], '', $link_cf, 'X-Requested-With: XMLHttpRequest')
			If StringInStr($result, 'Thẻ đã được sử dụng') > 0 Then
				_Text('Thẻ ' & $i & ": Thẻ đã được sử dụng")
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
			ElseIf StringInStr($result, 'Sai mật mã thẻ') > 0 Then
				_Text('Thẻ ' & $i & ': Sai mật mã thẻ')
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
			Else
				_Text('Thẻ ' & $i & ': Nạp thẻ thành công')
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Successed', $ListView1)
			EndIf
		EndIf
	Next
EndFunc   ;==>_Rec2
;==============================_Text============================
;==============================_Text============================


