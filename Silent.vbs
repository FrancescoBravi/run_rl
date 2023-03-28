Set oShell = CreateObject ("Wscript.Shell")
Dim strArgs
strArgs = "cmd /C RocketLeague.bat"
oShell.Run strArgs, 0, false