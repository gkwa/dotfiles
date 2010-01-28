@Echo off
REM Last modified $Id$
REM $HeadURL$
REM -*- bat -*-


set user=administrator
set homedir=%systemdrive%\cygwin\home\%user%
setx HOME "%homedir%"
echo %HOME%

mkdir "%homedir%"