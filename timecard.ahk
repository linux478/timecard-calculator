#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

InputBox, hoursWorked, Input Dialog, Enter hours worked, ,700,200
InputBox, startTime, Input Dialog, Enter start time, ,700,200

IfInString, A_DDDD, Sunday
{
  hoursNeeded = 0
}
IfInString, A_DDDD, Monday
{
  hoursNeeded = 8
}
IfInString, A_DDDD, Tuesday
{
  hoursNeeded = 16
}
IfInString, A_DDDD, Wednesday
{
  hoursNeeded = 24
}
IfInString, A_DDDD, Thursday
{
  hoursNeeded = 32
}
IfInString, A_DDDD, Friday
{
  hoursNeeded = 40
}
IfInString, A_DDDD, Saturday
{
  hoursNeeded = 40
}

hoursBalanced := hoursNeeded - hoursWorked
minutes := hoursBalanced * 60
if (minutes > (6 * 60))
{
  minutes := minutes + 30
}

time := StrSplit(starttime, ":")
minutes := time[1] * 60 + minutes
minutes := time[2] + minutes
hour := floor(minutes / 60)
minutes := ceil(mod(minutes,60))
Msgbox, Clock out time is %hour%:%minutes%
