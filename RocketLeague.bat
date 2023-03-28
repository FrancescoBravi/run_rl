@echo off

REM Per installazioni custom sostituire il valore delle variabili "BakkesModPath" e "RocketLeaguePath" con il path nei quali sono situati gli eseguibili di BakkesMod e Rocket League rispettivamente

set BakkesModPath=%ProgramFiles%\BakkesMod
set RocketLeaguePath=C:\Program Files\Epic Games\rocketleague\Binaries\Win64

REM ------------------------------------------------------------------------
REM                               Non toccare
REM ------------------------------------------------------------------------

set EpicGamesLauncher=com.epicgames.launcher://apps/9773aa1aa54f4f7b80e44bef04986cea%3A530145df28a24424923f5828cc9031a%3ASugar?silent=true

set processesList=EpicGamesLauncher BakkesMod RocketLeague

for %%a in (%processesList%) do (
	call :runProcess %%a launch%%a
	timeout /t 2
)

goto :end

:runProcess
	for /f %%a in ('tasklist ^| findstr "%~1.exe"') do (set foundProcessInstance=%%a)
	if "%foundProcessInstance%"=="" (
		echo Starting %~1.exe
		call :%~2
		echo Done
	) else (
		echo %~1.exe already running!
	)
	set foundProcessInstance=
	
	
:launchEpicGamesLauncher
	start "" "%EpicGamesLauncher%"
	goto :eof

:launchBakkesMod
	start "" "%BakkesModPath%\BakkesMod.exe"
	goto :eof

:launchRocketLeague
	start /wait "" "%RocketLeaguePath%\RocketLeague.exe"
	goto :eof
	
:end

pause