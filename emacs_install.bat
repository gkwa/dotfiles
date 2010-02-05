@Echo off
REM Last modified $Id$
REM $HeadURL$
REM -*- bat -*-

echo %cd%
set emacsdir=emacs-23.1
unzip -q -n %emacsdir%-bin-i386.zip

move %emacsdir% "%programfiles%"

:: ------------------------------
:: Fix known bug on windows:
:: http://stackoverflow.com/questions/885793/emacs-error-when-calling-server-start
:: ------------------------------

REM Warning (initialization): An error occurred while loading `c:/cygwin/home/administrator/.emacs':
REM error: The directory c:/cygwin/home/administrator/.emacs.d/server is unsafe

pushd "%programfiles%\%emacsdir%\lisp"
echo %cd%
move server.elc server.elc.orig
move server.el server.el.orig
popd

echo %cd%
copy /y "emacs_windows_fix\server.el" "%programfiles%\%emacsdir%\lisp"

.\pathman /au "%systemdrive%\cygwin\bin;%path%"