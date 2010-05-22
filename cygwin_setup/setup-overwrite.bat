@Echo off
REM Last modified $Id$
REM $HeadURL$
REM -*- bat -*-



set origsetup=%programfiles%\CygwinInstall\setup.exe.orig
set setup=%programfiles%\CygwinInstall\setup.exe
set newsetup=deploy\Program Files\CygwinInstall\setup.exe

if exist "%origsetup%" ( del /y "%origsetup%" )
copy /y "%setup%" "%setup%.orig"
copy /y "%newsetup%" "%setup%"
explorer "%programfiles%\CygwinInstall"