#include <_HttpRequest.au3>
#include <File.au3>

Func _tmp()
	$login = _HttpRequest(2, 'https://sso3.zing.vn/alogin', 'apikey=6e731b7ae5ca4146a880d7b956eb3649&pid=12&longtime=1&u=htth281199&p=Matkhauhung1&u1=https://pay.zing.vn/product/gunny&fp=https://pay.zing.vn/wplogin/pc/gunny', '', 'https://pay.zing.vn/wplogin/pc/gunny', 'Upgrade-Insecure-Requests: 1')
	Global $chuoi = StringRegExp($login, 'var serverList \= \[{(.*?)}\]\;', 1)
	If @error Then
		MsgBox(16, 'Error', 'Phát hiện sao chép bất hợp pháp!' & @CRLF & 'Đã khóa phần mềm!')
		Exit
	EndIf
EndFunc   ;==>_CheckOpen

Func _temp()  ;checkkeyhtth   matkhauhung
	$login = _HttpRequest(2, 'https://files.000webhost.com/handler.php?action=login', '{"action":"login","username":"checkkeyhtth","password":"matkhauhung"}', '', 'https://files.000webhost.com/', 'X-Requested-With: XMLHttpRequest')
	If StringInStr($login, 'Log in details are not correct') > 0 Then
		If Random(0, 1, 1) = 0 Then
			MsgBox(16, 'Error', 'Lỗi không xác định!' & @CRLF & 'Vui lòng liên hệ để khắc phục!')
			Exit
		Else
			MsgBox(16, 'Error', 'Dữ liệu trang chủ đã thay đổi' & @CRLF & 'Vui lòng liên hệ để cập nhật phần mềm!')
			Exit
		EndIf
	EndIf
EndFunc   ;==>_000webhostlogin

Func _dumamadownload($file)
	Global $download = _HttpRequest(2, 'https://files.000webhost.com/handler.php?action=download?action=download&path=%2Fpublic_html%2F' & $file, '{{"action":"getContent","item":"/public_html/' & $file & '"}', '', 'https://files.000webhost.com/', 'Upgrade-Insecure-Requests: 1')
EndFunc   ;==>_000webhostdownload

Func _dumamaedit($file, $data)  ;5000\n1200
	_HttpRequest(2, 'https://files.000webhost.com/handler.php?action=get', '{"action":"getContent","item":"/public_html/' & $file & '"}', '', 'https://files.000webhost.com/', 'X-Requested-With: XMLHttpRequest')
	_HttpRequest(2, 'https://files.000webhost.com/handler.php?action=edit', '{"action":"edit","item":"/public_html/' & $file & '","content":"' & $data & '"}', '', 'https://files.000webhost.com/', 'X-Requested-With: XMLHttpRequest')
EndFunc   ;==>_000webhostedit

