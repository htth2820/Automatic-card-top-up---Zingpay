#include <_HttpRequest.au3>
#include <pause.au3>

;$load=_HttpRequest(4,'https://pay.zing.vn/wplogin/pc/tanthienlong3d','','','','Upgrade-Insecure-Requests: 1')
;FileDelete(@ScriptDir&'\test.html')
;FileWrite(@ScriptDir&'\test.html',$load[1])
;ShellExecute(@ScriptDir&'\test.html')
;ShellExecute($load[1])
;$cookie=_GetCookie($load[0])
;MsgBox(0,0,$cookie)
;$load1=_HttpRequest(4,'https://analytics.mto.zing.vn/r/collect?v=1&_v=j69&a=1364104882&t=pageview&_s=1&dl=https%3A%2F%2Fpay.zing.vn%2Fwplogin%2Fpc%2Ftanthienlong3d&dp=%2Fwplogin&ul=en-us&de=UTF-8&dt=&sd=24-bit&sr=1366x768&vp=1366x654&je=0&_u=iCCAAUAB~&jid=1102464297&gjid=432884439&cid=563853377.1570940560&tid=UA-125904763-6&_gid=1804129927.1570940560&_r=1&gtm=n9o&z=748160905')
;$load2=_HttpRequest(4,'https://pay.mto.zing.vn/lp/login/getShopfront','shopfrontID=tanthienlong3d&lang=VI','','https://pay.zing.vn/wplogin/pc/tanthienlong3d','Origin: https://pay.zing.vn')
;$load3=_HttpRequest(4,'https://pay.zing.vn/wplogin/getCookie/pc')
;$load4=_HttpRequest(4,'https://analytics.mto.zing.vn/collect?v=1&_v=j69&a=1364104882&t=event&_s=2&dl=https%3A%2F%2Fpay.zing.vn%2Fwplogin%2Fpc%2Ftanthienlong3d&dp=%2Fwplogin%2Fpc%2Ftanthienlong3d&ul=en-us&de=UTF-8&dt=Tân Thiên Long&sd=24-bit&sr=1366x768&vp=1366x654&je=0&ec=authentication&ea=submit_login&el={"shopfrontID"%3A"tanthienlong3d"%2C"channel"%3A"zing"%2C"status"%3A"success"}&ev=1&_u=iCCAAUAB~&jid=&gjid=&cid=563853377.1570940560&tid=UA-125904763-6&_gid=1804129927.1570940560&gtm=n9o&z=813548630')

#Region Login
$load5=_HttpRequest(4,'https://sso3.zing.vn/alogin','apikey=6e731b7ae5ca4146a880d7b956eb3649&pid=12&longtime=1&u=lady8288nb1&p=13051986&u1=https://pay.zing.vn/product/tanthienlong3d&fp=https://pay.zing.vn/wplogin/pc/tanthienlong3d','','https://pay.zing.vn/wplogin/pc/tanthienlong3d','Upgrade-Insecure-Requests: 1')
$load6=_HttpRequest(4,'https://pay.zing.vn/ajax/check-account?productCode=tanthienlong3d&accountName=lady8288nb1&accountID=431895162&accountGuid=-1&serverID=all&roleID=','','','https://pay.zing.vn/product/tanthienlong3d?mess=succ&u=lady8288nb1','X-Requested-With: XMLHttpRequest')
FileDelete(@ScriptDir&'\test.html')
FileWrite(@ScriptDir&'\test.html',$load7[1])
ShellExecute(@ScriptDir&'\test.html')
$load7=_HttpRequest(4,'https://pay.zing.vn/payment/tanthienlong3d','sID=3114&serverID=all&pmOptID=35&pmcID=1&roleID=&roleName=&accountName=lady8288nb1','','https://pay.zing.vn/product/tanthienlong3d?mess=succ&u=lady8288nb1','Upgrade-Insecure-Requests: 1')
#EndRegion

#Region Nap the
$load8=_HttpRequest(4,'https://pay.zing.vn/ajax/payment-zingcard','pmcID=1&pmOptID=35&sID=3114&roleID=&roleName=&productCode=tanthienlong3d&cardSerial=WG0068128683&cardPassword=JPLDLYM9T&accountName=lady8288nb1','','https://pay.zing.vn/payment/tanthienlong3d','X-Requested-With: XMLHttpRequest')
$aID=StringRegExp($load8[1],'"transID":(.*?)\}',1)
$link_cf='https://new.pay.zing.vn/result/tanthienlong3d/'&$aID[0]
$load9=_HttpRequest(4,$link_cf,'pmcID=1&pmOptID=35','','https://new.pay.zing.vn/payment/tanthienlong3d','Upgrade-Insecure-Requests: 1')
$load10=_HttpRequest(4,'https://new.pay.zing.vn/ajax/get-result','transID='&$aID[0],'',$link_cf,'X-Requested-With: XMLHttpRequest')
If StringInStr($load10[1],'Thẻ đã được sử dụng')>0 Then
	MsgBox(0,0,"Thẻ đã được sử dụng")
EndIf
#EndRegion
#cs
FileDelete(@ScriptDir&'\test.html')
FileWrite(@ScriptDir&'\test.html',$load10[1])
ShellExecute(@ScriptDir&'\test.html')
#ce
