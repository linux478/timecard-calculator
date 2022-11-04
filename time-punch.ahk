#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

FormatTime, CurrentYear,, yyyy
FormatTime, CurrentMonthDay,, MM-dd
FormatTime, CurrentTime,, hh:mm
Week := SubStr(A_YWeek, -1)
Loop, Read, timecard.txt ; read the file line by line
{
   Line := A_LoopReadLine ; keep the content of the read line within a variable
   LineNum := A_Index ; keep the line number within a variable
}


str  := Line
match := A_Tab
StringReplace, Line, Line, %match%, %match%, UseErrorLevel
msgbox, %ErrorLevel%

if (ErrorLevel <> 1)
{
  goto ClockIn
}
if (ErrorLevel = 1)
{
  goto ClockOut
}
return

ClockIn:
 {
   FileAppend %CurrentYear%-%Week%-%CurrentMonthDay%`t%CurrentTime%, timecard.txt
 }
return

ClockOut:
 {
   FileAppend `t%CurrentTime%`n, timecard.txt
 }
return

guiclose:
exit:
 {
   exitapp
 }
return
