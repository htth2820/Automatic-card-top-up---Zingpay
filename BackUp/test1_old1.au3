#include <_HttpRequest.au3>
#include <pause.au3>
$acc='lady8288nb1'
	$pass='130519861'
	$login=_HttpRequest(2,'https://sso3.zing.vn/alogin','apikey=6e731b7ae5ca4146a880d7b956eb3649&pid=12&longtime=1&u='&$acc&'&p='&$pass&'&u1=https://pay.zing.vn/product/tanthienlong3d&fp=https://pay.zing.vn/wplogin/pc/tanthienlong3d','','https://pay.zing.vn/wplogin/pc/tanthienlong3d','Upgrade-Insecure-Requests: 1')

	$accountID=StringRegExp($login,'var accountID="(.*?)";',1)
	$accountGuid=StringRegExp($login,'var accountGuid="(.*?)";',1)
	$serverID=StringRegExp($login,',"serverID":"(.*?)","',1)
	$sID=StringRegExp($login,'\{"sID":(.*?),"',1)
	$load_payment=_HttpRequest(1,'https://pay.zing.vn/ajax/check-account?productCode=tanthienlong3d&accountName='&$acc&'&accountID='&$accountID[0]&'&accountGuid='&$accountGuid[0]&'&serverID='&$serverID[0]&'&roleID=','','','https://pay.zing.vn/product/tanthienlong3d?mess=succ&u='&$acc&'','X-Requested-With: XMLHttpRequest')
	$load7=_HttpRequest(2,'https://pay.zing.vn/payment/tanthienlong3d','sID='&$sID&'&serverID=all&pmOptID=35&pmcID=1&roleID=&roleName=&accountName='&$acc&'','','https://pay.zing.vn/product/tanthienlong3d?mess=succ&u='&$acc&'','Upgrade-Insecure-Requests: 1')
	FileDelete(@ScriptDir&'\test.html')
FileWrite(@ScriptDir&'\test.html',$load7[1])
ShellExecute(@ScriptDir&'\test.html')