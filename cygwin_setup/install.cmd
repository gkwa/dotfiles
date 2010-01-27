@Echo off
REM Last modified $Id$
REM $HeadURL$
REM -*- bat -*-

:: purpose:
:: 
:: download robocopy
:: copy uninstalled cygwin stuff to local drive
:: install cygwin stuff to local drive
::  a. setup.exe relies on setup.ini, not installed.db
::

:: ------------------------------
:: copy robocopy to local drive
:: ------------------------------
set sys32=%systemroot%\system32
if not exist "%sys32%\robocopy.exe" (
   pushd \\10.0.2.10\Development\tools
   copy robocopy.exe %sys32%
   popd
)




if exist %systemdrive%\cygwin\nul goto done

:: ------------------------------
:: copy cygwin stuff to local drive
:: ------------------------------
set src=\\10.0.2.10\Development\Cygwin\deploy\cygwin
set target=%systemdrive%
robocopy "%src%" %systemdrive%\cygwin /np /e /fp /tee /log:%windir%\temp\cygwin_setup.log

set src=\\10.0.2.10\Development\Cygwin\deploy\Program Files
set target=%systemdrive%\Program Files
robocopy "%src%" "%target%" /np /e /fp /tee /log:%windir%\temp\cygwin_setup.log

:: ------------------------------
:: instal cygwin stuff
:: ------------------------------
pushd "%target%\CygwinInstall"
.\setup --no-desktop --quiet-mode --local-install --local-package-dir "%target%\CygwinInstall" 
:: somehow, miraculously, this finds the directory "http%3a%2f%2fcygwin.lilengine.com%2f"
popd



:done


:: echo c:\image_backup.bat reporting | blat - -subject "RD Ghost backup log" -attacht %log% -server 10.0.2.69 ^
::   -f bugzilla@streambox.com -sender RD_Ghost@streambox.com -to root@[10.0.2.69]

:: echo c:\image_backup.bat reporting | blat - -bodyF c:\image_backup_mail.txt -subject "RD Ghost backup log" -attacht %log% -server 10.0.2.69 ^
::   -f bugzilla@streambox.com -sender RD_Ghost@streambox.com -to taylor.monacelli@streambox.com,tho@streambox.com
ping -n 20 127.0.0.1


:: Emacs vars
:: Local Variables: ***
:: comment-column:0 ***
:: tab-width: 4 ***
:: comment-start:":: " ***
:: End: ***
