#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\Desktop\Release\icon.ico
#AutoIt3Wrapper_Outfile=AutoZingPay_x86.exe
#AutoIt3Wrapper_Outfile_x64=AutoZingPay_x64.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Comment=AutoZingPay
#AutoIt3Wrapper_Res_Description=Tự động nạp thẻ Zing game Tân Thiên Long
#AutoIt3Wrapper_Res_Fileversion=1.0.0.2
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_ProductName=AutoRegFTU
#AutoIt3Wrapper_Res_ProductVersion=1.0.0
#AutoIt3Wrapper_Res_CompanyName=Trần Thanh Hùng
#AutoIt3Wrapper_Add_Constants=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; *** Start added by AutoIt3Wrapper ***
#include <FileConstants.au3>
; *** End added by AutoIt3Wrapper ***

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <ComboConstants.au3>
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
$Form1 = GUICreate("AutoZingPay ver 2.0.0 - by Trần Thanh Hùng", 609, 448, 359, 157)
GUISetFont(10, 400, 0, "MS Sans Serif")
GUISetBkColor(0x646464, $Form1)

$ListView1 = GUICtrlCreateListView("Serial|CardCode|Status", 245, 128, 245, 305, BitOR($ES_AUTOVSCROLL, $ES_READONLY, $WS_VSCROLL))
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 100)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 82)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 2, 60)
_GUICtrlListView_JustifyColumn(GUICtrlGetHandle($ListView1), 0, 2)
_GUICtrlListView_JustifyColumn(GUICtrlGetHandle($ListView1), 1, 2)
_GUICtrlListView_JustifyColumn(GUICtrlGetHandle($ListView1), 2, 2)
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)
;_GUICtrlListView_DeleteAllItems($ListView1)
;GUICtrlCreateListViewItem($split_data[3] & '|' & $sub_data[2] & '|' & 'Thất Bại', $ListView1)
$LAccount = GUICtrlCreateLabel("Account:", 16, 16, 63, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, "-2")

$LPassword = GUICtrlCreateLabel("Password:", 248, 16, 76, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, "-2")

$Account = GUICtrlCreateInput("lady8288nb1", 80, 16, 153, 21, BitOR($GUI_SS_DEFAULT_INPUT, $WS_BORDER))
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)

$Password = GUICtrlCreateInput("13051986", 328, 16, 145, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_PASSWORD, $WS_BORDER))
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)

$Edit1 = GUICtrlCreateEdit("", 16, 128, 217, 305, BitOR($ES_AUTOVSCROLL, $ES_READONLY, $WS_VSCROLL))
GUICtrlSetData(-1, '')
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)

$Label3 = GUICtrlCreateLabel("STATUS", 72, 104, 73, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)

$Label4 = GUICtrlCreateLabel("RESULT", 320, 104, 74, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)

$BLogin = GUICtrlCreateButton("LOGIN", 504, 12, 81, 80)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)

$instruc = GUICtrlCreateButton("Instruction", 504, 144, 81, 33)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)

$recharge = GUICtrlCreateButton("Recharge", 504, 304, 81, 33)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)

$open = GUICtrlCreateButton("Open", 504, 224, 81, 33)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)

$about = GUICtrlCreateButton("About", 504, 368, 81, 33)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)

$Game = GUICtrlCreateLabel("Game:", 16, 64, 49, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, "-2")

$Server = GUICtrlCreateLabel("Server:", 248, 64, 54, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, "-2")

$CGame = GUICtrlCreateCombo("", 80, 64, 153, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)
GUICtrlSetData(-1, 'Tân Thiên Long|Võ Lâm Truyền Kỳ 1|Võ Lâm Truyền Kỳ 2|Kiếm Thế|Gunny')

$CServer = GUICtrlCreateCombo("", 328, 64, 145, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)

#cs $Confirm = GUICtrlCreateButton("CONFIRM", 504, 56, 81, 33)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
#ce $Confirm = GUICtrlCreateButton("CONFIRM", 504, 56, 81, 33)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
#Region  ### Main ###
$sc_name = ''
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $BLogin
			If GUICtrlRead($BLogin) = 'LOGIN' Then
				Switch GUICtrlRead($CGame)
					Case 'Tân Thiên Long'
						$pmOptID = 35
						$game_name = 'tanthienlong3d'
						_Login()
						_Text('[+] Đã chọn: Tân Thiên Long')
					Case 'Võ Lâm Truyền Kỳ 1'
						$pmOptID = 50
						$game_name = 'volamtruyenky'
						_Login()
						_Text('[+] Đã chọn: Võ Lâm Truyền Kỳ 1')
					Case 'Võ Lâm Truyền Kỳ 2'
						$pmOptID = 42
						$game_name = 'volam2'
						_Login()
						_Text('[+] Đã chọn: Võ Lâm Truyền Kỳ 2')
					Case 'Kiếm Thế'
						$pmOptID = ''
						$game_name = 'kiemthe'
						_Login()
						_Text('[+] Đã chọn: Kiếm Thế')
					Case 'Gunny'
						$pmOptID = ''
						$game_name = 'gunny'
						_Login()
						_Text('[+] Đã chọn: Gunny')
						_Text('[+] Server: ' & GUICtrlRead($CServer))
				EndSwitch
			Else
				_Logout()
			EndIf
			#cs		Case $Confirm
						Switch GUICtrlRead($CGame)
							Case 'Tân Thiên Long'
								$pmOptID = 35
								$game_name = 'tanthienlong3d'
								_Text('[+] Đã chọn: Tân Thiên Long')
							Case 'Võ Lâm Truyền Kỳ 1'
								$pmOptID = 50
								$game_name = 'volamtruyenky'
								_Text('[+] Đã chọn: Võ Lâm Truyền Kỳ 1')
							Case 'Võ Lâm Truyền Kỳ 2'
								$pmOptID = 42
								$game_name = 'volam2'
								_Text('[+] Đã chọn: Võ Lâm Truyền Kỳ 2')
							Case 'Kiếm Thế'
								$pmOptID = ''
								$game_name = 'kiemthe'
								_Text('[+] Đã chọn: Kiếm Thế')
							Case 'Gunny'
								$pmOptID = ''
								$game_name = 'gunny'
								_Text('[+] Đã chọn: Gunny')
								_Text('[+] Server: ' & GUICtrlRead($CServer))
			#ce		Case $Confirm
		Case $instruc
			ShellExecute(@ScriptDir & '\README.txt')
		Case $open
			$file = FileOpenDialog('Choose the file .txt', @ScriptDir & '\', 'Text (*.txt)', BitOR($FD_FILEMUSTEXIST, $FD_MULTISELECT))
			_Text('[+] Load danh sách mã nạp thành công!')
		Case $recharge
			If StringInStr(FileReadLine($file, 1), ':') > 0 Then
				_Rec1()
			Else
				_Rec2()
			EndIf
		Case $about
			_LoginGunny()
			;_showAboutDialog('Auto Recharge Zing Pay', '2.0.0', 'Trần Thanh Hùng', Default, Default, 'https://www.facebook.com/darrenhtth')
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd
#EndRegion  ### Main ###
;$file = FileOpenDialog
;==============================_Text============================
Func _Text($txt)
	GUICtrlSetData($Edit1, $txt & @CRLF, 1)
EndFunc   ;==>_Text

;==============================_Login============================
Func _Login()
	Global $acc = GUICtrlRead($Account)
	$pass = GUICtrlRead($Password)
	$login = _HttpRequest(2, 'https://sso3.zing.vn/alogin', 'apikey=6e731b7ae5ca4146a880d7b956eb3649&pid=12&longtime=1&u=' & $acc & '&p=' & $pass & '&u1=https://pay.zing.vn/product/' & $game_name & '&fp=https://pay.zing.vn/wplogin/pc/' & $game_name, '', 'https://pay.zing.vn/wplogin/pc/' & $game_name, 'Upgrade-Insecure-Requests: 1')
	#cs	FileDelete(@ScriptDir & '\test.html')
		FileWrite(@ScriptDir & '\test.html', $login)
		ShellExecute(@ScriptDir & '\test.html')
	#ce	FileDelete(@ScriptDir & '\test.html')
	If @error Then
		_Text('[+] Sai tên đăng nhập hoặc mật khẩu.' & @CRLF & 'Vui lòng đăng nhập lại!')
	Else
		Global $sID = StringRegExp($login, '\{"sID":(.*?),"', 1)
		#cs
		$accountGuid = StringRegExp($login, 'var accountGuid="(.*?)";', 1)
		$serverID = StringRegExp($login, ',"serverID":"(.*?)","', 1)
		$load_payment = _HttpRequest(1, 'https://pay.zing.vn/ajax/check-account?productCode=tanthienlong3d&accountName=' & $acc & '&accountID=' & $accountID[0] & '&accountGuid=' & $accountGuid[0] & '&serverID=' & $serverID[0] & '&roleID=', '', '', 'https://pay.zing.vn/product/tanthienlong3d?mess=succ&u=' & $acc & '', 'X-Requested-With: XMLHttpRequest')
				$login_success = _HttpRequest(2, 'https://pay.zing.vn/payment/tanthienlong3d', 'sID=' & $sID[0] & '&serverID=all&pmOptID=35&pmcID=1&roleID=&roleName=&accountName=' & $acc & '', '', 'https://pay.zing.vn/product/tanthienlong3d?mess=succ&u=' & $acc & '', 'Upgrade-Insecure-Requests: 1')
		#ce
		$name = StringRegExp($login, 'class="fr">Xin chào(.*?) <a href=', 1)
		If @error Then
			_Text('[+] Lỗi không xác định, vui lòng thử lại sau.')
		Else
			_Text('[+] Đăng nhập thành công!' & @CRLF & '[+] Xin chào' & $name[0])
			GUICtrlSetData($BLogin, 'LOGOUT')
		EndIf
	EndIf
EndFunc   ;==>_Login

;==============================_Recharge============================
Func _Rec1()
	For $i = 1 To _FileCountLines($file) Step 2
		$aserial = StringSplit(FileReadLine($file, $i + 1), ':')
		$serial = StringReplace($aserial[2], '-', '')
		$acardpass = StringSplit(FileReadLine($file, $i), ':')
		$cardpass = StringReplace($acardpass[2], '-', '')
		$t = ($i + 1) / 2
		If StringLen($serial) <> 12 Then
			_Text('Thẻ ' & $t & ': Số seri không hợp lệ')
			GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
		Else
			$rec = _HttpRequest(2, 'https://pay.zing.vn/ajax/payment-zingcard', 'pmcID=1&pmOptID=' & $pmOptID & '&sID=' & $sID[0] & '&roleID=&roleName=&productCode=' & $game_name & '&cardSerial=' & $serial & '&cardPassword=' & $cardpass & '&accountName=' & $acc & '', '', 'https://pay.zing.vn/payment/' & $game_name, 'X-Requested-With: XMLHttpRequest')
			$aID = StringRegExp($rec, '"transID":(.*?)\}', 1)
			$link_cf = 'https://new.pay.zing.vn/result/' & $game_name & '/' & $aID[0]
			$cf = _HttpRequest(2, $link_cf, 'pmcID=1&pmOptID=' & $pmOptID, '', 'https://new.pay.zing.vn/payment/' & $game_name, 'Upgrade-Insecure-Requests: 1')
			#cs			FileDelete(@ScriptDir & '\test.html')
						FileWrite(@ScriptDir & '\test.html', $cf)
			#ce			FileDelete(@ScriptDir & '\test.html')
			$result = _HttpRequest(2, 'https://new.pay.zing.vn/ajax/get-result', 'transID=' & $aID[0], '', $link_cf, 'X-Requested-With: XMLHttpRequest')
			#cs			FileDelete(@ScriptDir & '\test.html')
						FileWrite(@ScriptDir & '\test.html', $cf)
			#ce			FileDelete(@ScriptDir & '\test.html')
			If StringInStr($result, 'Thẻ đã được sử dụng') > 0 Then
				_Text('Thẻ ' & $t & ": Thẻ đã được sử dụng")
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
			ElseIf StringInStr($result, 'Sai mật mã thẻ') > 0 Then
				_Text('Thẻ ' & $t & ': Sai mật mã thẻ')
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
			Else
				_Text('Thẻ ' & $t & ': Nạp thẻ thành công')
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'OK', $ListView1)
			EndIf
		EndIf
		#cs		FileDelete(@ScriptDir&'\test.html')
				FileWrite(@ScriptDir&'\test.html',$result)
				ShellExecute(@ScriptDir&'\test.html')
		#ce		FileDelete(@ScriptDir&'\test.html')
		Sleep(10000)
	Next
EndFunc   ;==>_Rec1
;==============================_Reg2============================
Func _Rec2()
	For $i = 1 To _FileCountLines($file) Step 1
		$code = StringSplit(FileReadLine($file, $i), ' ')
		$serial = $code[2]
		$cardpass = $code[1]
		If StringLen($serial) <> 12 Then
			_Text('Thẻ ' & $i & ': Số seri không hợp lệ')
			GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
		Else
			$rec = _HttpRequest(2, 'https://pay.zing.vn/ajax/payment-zingcard', 'pmcID=1&pmOptID=' & $pmOptID & '&sID=' & $sID[0] & '&roleID=&roleName=&productCode=' & $game_name & '&cardSerial=' & $serial & '&cardPassword=' & $cardpass & '&accountName=' & $acc & '', '', 'https://pay.zing.vn/payment/' & $game_name, 'X-Requested-With: XMLHttpRequest')
			$aID = StringRegExp($rec, '"transID":(.*?)\}', 1)
			$link_cf = 'https://new.pay.zing.vn/result/' & $game_name & '/' & $aID[0]
			$cf = _HttpRequest(2, $link_cf, 'pmcID=1&pmOptID=' & $pmOptID, '', 'https://new.pay.zing.vn/payment/' & $game_name, 'Upgrade-Insecure-Requests: 1')
			$result = _HttpRequest(2, 'https://new.pay.zing.vn/ajax/get-result', 'transID=' & $aID[0], '', $link_cf, 'X-Requested-With: XMLHttpRequest')
			If StringInStr($result, 'Thẻ đã được sử dụng') > 0 Then
				_Text('Thẻ ' & $i & ": Thẻ đã được sử dụng")
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
			ElseIf StringInStr($result, 'Sai mật mã thẻ') > 0 Then
				_Text('Thẻ ' & $i & ': Sai mật mã thẻ')
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
			Else
				_Text('Thẻ ' & $i & ': Nạp thẻ thành công')
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'OK', $ListView1)
			EndIf
		EndIf
		#cs		FileDelete(@ScriptDir&'\test.html')
				FileWrite(@ScriptDir&'\test.html',$result)
				ShellExecute(@ScriptDir&'\test.html')
		#ce		FileDelete(@ScriptDir&'\test.html')
		Sleep(10000)
	Next
EndFunc   ;==>_Rec2
;==============================_Logout============================
Func _Logout()
	_GUICtrlListView_DeleteAllItems($ListView1)
	GUICtrlSetData($Edit1, '')
	GUICtrlSetData($BLogin, 'LOGIN')
EndFunc   ;==>_Logout

;==============================_Volam========================
Func _LoginGunny()
	Global $acc = GUICtrlRead($Account)
	$pass = GUICtrlRead($Password)
	$game_name = 'gunny'
	$login = _HttpRequest(2, 'https://sso3.zing.vn/alogin', 'apikey=6e731b7ae5ca4146a880d7b956eb3649&pid=12&longtime=1&u=' & $acc & '&p=' & $pass & '&u1=https://pay.zing.vn/product/' & $game_name & '&fp=https://pay.zing.vn/wplogin/pc/' & $game_name, '', 'https://pay.zing.vn/wplogin/pc/' & $game_name, 'Upgrade-Insecure-Requests: 1')
	$accountID = StringRegExp($login, 'var accountID="(.*?)";', 1)
	If @error Then
		_Text('[+] Sai tên đăng nhập hoặc mật khẩu.' & @CRLF & 'Vui lòng đăng nhập lại!')
	Else
		$chuoi = StringRegExp($login, 'var serverList \= \[{(.*?)}\]\;', 1)
		$tach = StringSplit($chuoi[0], '},{', 1)
		Dim $sname[411], $sc_serverID[411]
		For $i = 1 To $tach[0]
			$a = StringRegExp($tach[$i], 'serverName":"(.*?)"', 1)
			$b = StringRegExp($tach[$i], 'serverID":"(.*?)"', 1)
			$sname[$i-1]=$a[0]
			$sc_serverID[$i-1]=$b[0]
			$sc_name=$sc_name &'|'& $sname[$i-1]
		Next
		$sc_name=StringRight($sc_name,StringLen($sc_name)-1)
		GUICtrlSetData($CServer,$sb_name)
		GUICtrlRead($CServer)
		$get_server = _HttpRequest(2, 'https://new.pay.zing.vn/ajax/get-role-list?productCode=gunny&accountName=' & $acc & '&accountID=' & $accountID & '&serverID=383', '', '', 'https://new.pay.zing.vn/product/gunny', 'X-Requested-With: XMLHttpRequest')
		FileDelete(@ScriptDir & '\test.html')
		FileWrite(@ScriptDir & '\test.html', $get_server)
		ShellExecute(@ScriptDir & '\test.html')
		#cs
		$accountGuid = StringRegExp($login, 'var accountGuid="(.*?)";', 1)
		$serverID = StringRegExp($login, ',"serverID":"(.*?)","', 1)
		$load_payment = _HttpRequest(1, 'https://pay.zing.vn/ajax/check-account?productCode=tanthienlong3d&accountName=' & $acc & '&accountID=' & $accountID[0] & '&accountGuid=' & $accountGuid[0] & '&serverID=' & $serverID[0] & '&roleID=', '', '', 'https://pay.zing.vn/product/tanthienlong3d?mess=succ&u=' & $acc & '', 'X-Requested-With: XMLHttpRequest')
				$login_success = _HttpRequest(2, 'https://pay.zing.vn/payment/tanthienlong3d', 'sID=' & $sID[0] & '&serverID=all&pmOptID=35&pmcID=1&roleID=&roleName=&accountName=' & $acc & '', '', 'https://pay.zing.vn/product/tanthienlong3d?mess=succ&u=' & $acc & '', 'Upgrade-Insecure-Requests: 1')
		#ce
		$name = StringRegExp($login, 'class="fr">Xin chào(.*?) <a href=', 1)
		If @error Then
			_Text('[+] Lỗi không xác định, vui lòng thử lại sau.')
		Else
			_Text('[+] Đăng nhập thành công!' & @CRLF & '[+] Xin chào' & $name[0])
			GUICtrlSetData($BLogin, 'LOGOUT')
		EndIf
	EndIf
EndFunc   ;==>_LoginGunny

#cs	FileDelete(@ScriptDir & '\test.html')
	FileWrite(@ScriptDir & '\test.html', $volam)
#ce	FileDelete(@ScriptDir & '\test.html')





