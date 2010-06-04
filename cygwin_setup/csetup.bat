@Echo off
REM Last modified $Id$
REM $HeadURL$
REM -*- bat -*-

:: ------------------------------
:: put c.bat in %systemroot%\system32 to enable quick cygwin start
:: convenience method
:: ------------------------------
cd "%systemroot%\system32"
echo @Echo off					> c.bat
echo cd %systmdrive%\cygwin			>> c.bat
echo call Cygwin.bat				>> c.bat

