;set hotkeys used
;i've bound my macro key on my blackwidow v2 to f17 to f21
F17::switchToFirefox()
F18::switchToSteam()
F19::switchToDiscord()
F20::switchToSpotify()

switchToFirefox(){
sendinput, {SC0E8} ;scan code of an unassigned key. Do I NEED this?
IfWinNotExist, ahk_class MozillaWindowClass
	Run, firefox.exe
else
	{
	;WinRestore ahk_exe firefox.exe
	WinActivatebottom ahk_exe firefox.exe
	;sometimes winactivate is not enough. the window is brought to the foreground, but not put into FOCUS.
	;the below code should fix that.
	WinGet, hWnd, ID, ahk_class MozillaWindowClass
	DllCall("SetForegroundWindow", UInt, hWnd) 
	}
}

switchToSteam(){
;;sendinput, {SC0E8} ;scan code of an unassigned key. Do I NEED this?
IfWinNotExist, Steam
	Run, C:\Program Files (x86)\Steam\Steam.exe
else
	{
	;WinRestore ahk_exe Steam.exe
	WinActivatebottom Steam
	;sometimes winactivate is not enough. the window is brought to the foreground, but not put into FOCUS.
	;the below code should fix that.
	WinGet, hWnd, ID, ahk_class vguiPopupWindow
	DllCall("SetForegroundWindow", UInt, hWnd) 
	;move to location on second display
	;used becuase windows likes to move things around when locking/sleeping
	;;WinGetTitle, Title, A
	;;Sleep, 50
	;;WinMove, %Title%, , 1920, -420, 1080, 600
	}
}

switchToDiscord(){
;;sendinput, {SC0E8} ;scan code of an unassigned key. Do I NEED this?
IfWinNotExist, ahk_exe Discord.exe
	Run, C:\Users\still\AppData\Local\Discord\Update.exe --processStart Discord.exe
else
	{
	;WinRestore ahk_exe Steam.exe
	WinActivatebottom ahk_exe Discord.exe
	;sometimes winactivate is not enough. the window is brought to the foreground, but not put into FOCUS.
	;the below code should fix that.
	WinGet, hWnd, ID, ahk_exe Discord.exe
	DllCall("SetForegroundWindow", UInt, hWnd) 
	;move window
	;;WinGetTitle, Title, A
	;;Sleep, 50
	;;WinMove, %Title%, , 1920, 180, 1080, 1320
	}
}

switchToSpotify(){
;;sendinput, {SC0E8} ;scan code of an unassigned key. Do I NEED this?
IfWinNotExist, ahk_exe Spotify.exe
	Run, C:\Users\still\AppData\Roaming\Spotify\Spotify.exe
else
	{
	;WinRestore ahk_exe Spotify.exe
	WinActivatebottom Spotify
	;sometimes winactivate is not enough. the window is brought to the foreground, but not put into FOCUS.
	;the below code should fix that.
	WinGet, hWnd, ID, ahk_exe Spotify.exe
	DllCall("SetForegroundWindow", UInt, hWnd)
	;move window
	;;WinGetTitle, Title, A
	;;Sleep, 50
	;;WinMove, %Title%, , 30, 30, 1500, 800
	}
}
