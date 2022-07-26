#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
#ErrorStdOut
SetControlDelay 0

Menu, tray, Icon, %A_WinDir%\PrintDialog\SmallLogo.png
Menu, Tray, NoStandard
Menu, Tray, Add, Exit, GuiClose

IniRead, WindowName, config.ini, config, WindowToPrint

loop{
	WinWait, %WindowName%,
	IfWinActive, %WindowName%, WinActivate, %WindowName%,
	WinWaitActive, %WindowName%,

	clipboardsaved:=clipboardall
	clipboard=
	Send, {CTRLDOWN}ac{CTRLUP}
	clipwait
	send, ^{w}
	label:=clipboard
	clipboard:=clipboardsaved
	DYMOPrint(label)
}

DYMOPrint(string)
{
		DymoAddIn := ComObjCreate("DYMO.DymoAddIn")
		DymoLabel := ComObjCreate("DYMO.DymoLabels")
		DymoAddin.StartPrintJob()
		DymoAddIn.Open(A_ScriptDir default.label)
		DymoLabel.SetAddress( 1, string )
		DymoAddIn.Print( 1, TRUE )
		DymoAddin.EndPrintJob()
}

GuiClose:
exit

tester