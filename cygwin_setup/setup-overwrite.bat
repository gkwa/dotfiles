@Echo off
REM Last modified $Id$
REM $HeadURL$
REM -*- bat -*-


move "deploy\Program Files\CygwinInstall\setup.exe" "Program Files\CygwinInstall\setup.exe.new"
cd %systemdrive%
del /q "Program Files\CygwinInstall\setup.exe.old"
move "Program Files\CygwinInstall\setup.exe" "Program Files\CygwinInstall\setup.exe.old"
move "Program Files\CygwinInstall\setup.exe.new" "Program Files\CygwinInstall\setup.exe"