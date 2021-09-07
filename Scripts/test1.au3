#include <Array.au3>
#include <MsgBoxConstants.au3>
$file=FileReadLine(@ScriptDir&'\server.html',70)
$chuoi=StringRegExp($file,'var serverList \= \[{(.*?)}\]\;',1)
$tach=StringSplit($chuoi[0],'},{',1)
Dim $sname[410]
$sb_name=''
For $i=1 To $tach[0]
	$a=StringRegExp($tach[$i],'serverName":"(.*?)"',1)
	$sname[$i-1]=$a[0]
	$sb_name=$sb_name &'|'& $sname[$i-1]
Next
$sb_name=StringRight($sb_name,StringLen($sb_name)-1)
MsgBox(0,0,$sb_name)





#cs#include <_HttpRequest.au3>
#include <pause.au3>
$acc = 'lady8288nb1'
$pass = '13051986'
$login = _HttpRequest(2, 'https://sso3.zing.vn/alogin', 'apikey=6e731b7ae5ca4146a880d7b956eb3649&pid=12&longtime=1&u=' & $acc & '&p=' & $pass & '&u1=https://pay.zing.vn/product/tanthienlong3d&fp=https://pay.zing.vn/wplogin/pc/tanthienlong3d', '', 'https://pay.zing.vn/wplogin/pc/tanthienlong3d', 'Upgrade-Insecure-Requests: 1')

$accountID = StringRegExp($login, 'var accountID="(.*?)";', 1)

If @error Then
	MsgBox(0,0,'loi')
EndIf

$accountGuid = StringRegExp($login, 'var accountGuid="(.*?)";', 1)
$serverID = StringRegExp($login, ',"serverID":"(.*?)","', 1)
$sID = StringRegExp($login, '\{"sID":(.*?),"', 1)
$load_payment = _HttpRequest(1, 'https://pay.zing.vn/ajax/check-account?productCode=tanthienlong3d&accountName=' & $acc & '&accountID=' & $accountID[0] & '&accountGuid=' & $accountGuid[0] & '&serverID=' & $serverID[0] & '&roleID=', '', '', 'https://pay.zing.vn/product/tanthienlong3d?mess=succ&u=' & $acc & '', 'X-Requested-With: XMLHttpRequest')
$load7 = _HttpRequest(2, 'https://pay.zing.vn/payment/tanthienlong3d', 'sID=' & $sID[0] & '&serverID=all&pmOptID=35&pmcID=1&roleID=&roleName=&accountName=' & $acc & '', '', 'https://pay.zing.vn/product/tanthienlong3d?mess=succ&u=' & $acc & '', 'Upgrade-Insecure-Requests: 1')
$name=StringRegExp($load7,'class="fr">Xin chào(.*?) <a href=',1)
_ArrayDisplay($name)

FileDelete(@ScriptDir & '\test.html')
FileWrite(@ScriptDir & '\test.html', $load7)
ShellExecute(@ScriptDir & '\test.html')
#ce