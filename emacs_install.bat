@Echo off
REM Last modified $Id$
REM $HeadURL$
REM -*- bat -*-

echo %cd%
unzip -q -n emacs-23.1-bin-i386.zip
move emacs-23.1 "%programfiles%"

:: ------------------------------
:: Fix known bug on windows:
:: http://stackoverflow.com/questions/885793/emacs-error-when-calling-server-start
:: ------------------------------

REM Warning (initialization): An error occurred while loading `c:/cygwin/home/administrator/.emacs':
REM error: The directory c:/cygwin/home/administrator/.emacs.d/server is unsafe

pushd "%programfiles%\emacs-23.1\lisp"
echo %cd%
move server.elc server.elc.orig
move server.el server.el.orig
popd

echo %cd%
copy /y "deploy\Program Files\emacs_windows_fix\server.el" "%programfiles%\emacs-23.1\lisp"
