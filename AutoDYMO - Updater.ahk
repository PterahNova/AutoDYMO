#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

IniRead, CurVer, config.ini, config, Version
IniRead, NextVer, Latest Version.ini, config, Version
FileDelete, Latest Version.ini
if (NextVer > CurVer) {
	FileDelete, AutoDYMO.exe
	UrlDownloadToFile, https://github.com/PterahNova/AutoDYMO/releases/download/AutoDYMO-v%NextVer%/AutoDYMO.exe, AutoDYMO.exe
	IniWrite, %NextVer%, config.ini, config, Version
	Run, AutoDYMO.exe
}

ExitApp