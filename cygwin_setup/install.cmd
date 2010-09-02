@Echo off
REM Last modified $Id$
REM $HeadURL$
REM -*- bat -*-

cd cygwin_setup

:: deploy\cygwin and deploy\Program Files will get pushed to %systemdrive%\cygwin %systemdrive%\Program Files
xcopy /H/F/I/V/R/Y/E deploy %systemdrive%\

%systemdrive%
cd "%programfiles%\CygwinInstall"

set target=%systemdrive%
:: somehow, miraculously, this finds the directory "http%3a%2f%2fcygwin.lilengine.com%2f"
:: CLI arguments documented here: http://www.cygwin.com/faq/faq.setup.html#faq.setup.cli
.\setup --no-desktop --quiet-mode --local-install --local-package-dir "%ProgramFiles%\CygwinInstall" 

setx CYGWIN "binmode ntsec tty" -m 

.\pathman /au "%systemdrive%\cygwin\bin;%path%"
.\pathman /au "%systemdrive%\cygwin\usr\local\bin;%path%"

goto end

:end

:: Emacs vars
:: Local Variables: ***
:: comment-column:0 ***
:: tab-width: 4 ***
:: comment-start:":: " ***
:: End: ***
