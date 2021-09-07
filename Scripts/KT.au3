#include <_HttpRequest.au3>
#include <pause.au3>
$game_name='kiemthe'
$acc='lady8288nb1'
$pass='13051986'
$total=0
$login = _HttpRequest(2, 'https://sso3.zing.vn/alogin', 'apikey=6e731b7ae5ca4146a880d7b956eb3649&pid=12&longtime=1&u=' & $acc & '&p=' & $pass & '&u1=https://pay.zing.vn/product/' & $game_name & '&fp=https://pay.zing.vn/wplogin/pc/' & $game_name, '', 'https://pay.zing.vn/wplogin/pc/' & $game_name, 'Upgrade-Insecure-Requests: 1')
$link_cf = 'https://new.pay.zing.vn/result/kiemthe/201911020146873'
$a=_HttpRequest(2, 'https://new.pay.zing.vn/ajax/get-result', 'transID=201911020146873' , '', $link_cf, 'X-Requested-With: XMLHttpRequest')
$b=Number(StringRegExp($a,'"netValue":"(.*?)"',1)[0])
MsgBox(0,0,$b)
; FileDelete(@ScriptDir & '\test.txt')
;FileWrite(@ScriptDir & '\test.txt', $a)
; ShellExecute(@ScriptDir & '\test.txt')

;MsgBox(0,0,Number(10,000))
#cs $login=_HttpRequest(2,'https://files.000webhost.com/handler.php?action=login','{"action":"login","username":"checkkeyhtth","password":"matkhauhung"}','','https://files.000webhost.com/','X-Requested-With: XMLHttpRequest')
;$login=_HttpRequest(2,'https://files.000webhost.com/handler.php?action=appinfo','{"action":"appinfo"}','','https://files.000webhost.com/','X-Requested-With: XMLHttpRequest')
;$login=_HttpRequest(2,'https://files.000webhost.com/handler.php?action=list','{"action":"list","path":"/"}','','https://files.000webhost.com/','X-Requested-With: XMLHttpRequest')
;$login=_HttpRequest(2,'https://files.000webhost.com/handler.php?action=list','{"action":"list","path":"/public_html"}','','https://files.000webhost.com/','X-Requested-With: XMLHttpRequest')
;$login=_HttpRequest(2,'https://files.000webhost.com/handler.php?action=get','{"action":"getContent","item":"/public_html/Data.txt"}','','https://files.000webhost.com/','X-Requested-With: XMLHttpRequest')
;$login=_HttpRequest(2,'https://files.000webhost.com/handler.php?action=edit','{"action":"edit","item":"/public_html/Data.txt","content":"5000\n1200"}','','https://files.000webhost.com/','X-Requested-With: XMLHttpRequest')
$login=_HttpRequest(2,'https://files.000webhost.com/handler.php?action=download?action=download&path=%2Fpublic_html%2Freport.txt','{{"action":"getContent","item":"/public_html/report.txt"}','','https://files.000webhost.com/','Upgrade-Insecure-Requests: 1')
 FileDelete(@ScriptDir & '\test.txt')
FileWrite(@ScriptDir & '\test.txt', $login)
 ShellExecute(@ScriptDir & '\test.txt')
 #ce
