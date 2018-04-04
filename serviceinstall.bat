@echo off
rem -- Check if argument is INSTALL or REMOVE

if not ""%1"" == ""INSTALL"" goto remove

if exist C:\TimeTrex\mysql\scripts\serviceinstall.bat (start /MIN C:\TimeTrex\mysql\scripts\serviceinstall.bat INSTALL)
if exist C:\TimeTrex\postgresql\scripts\serviceinstall.bat (start /MIN C:\TimeTrex\postgresql\scripts\serviceinstall.bat INSTALL)
if exist C:\TimeTrex\apache2\scripts\serviceinstall.bat (start /MIN C:\TimeTrex\apache2\scripts\serviceinstall.bat INSTALL)
if exist C:\TimeTrex\apache-tomcat\scripts\serviceinstall.bat (start /MIN C:\TimeTrex\apache-tomcat\scripts\serviceinstall.bat INSTALL)
if exist C:\TimeTrex\openoffice\scripts\serviceinstall.bat (start /MIN C:\TimeTrex\openoffice\scripts\serviceinstall.bat INSTALL)
if exist C:\TimeTrex\subversion\scripts\serviceinstall.bat (start /MIN C:\TimeTrex\subversion\scripts\serviceinstall.bat INSTALL)
rem RUBY_APPLICATION_INSTALL
if exist C:\TimeTrex\lucene\scripts\serviceinstall.bat (start /MIN C:\TimeTrex\lucene\scripts\serviceinstall.bat INSTALL)

goto end

:remove

if exist C:\TimeTrex\mysql\scripts\serviceinstall.bat (start /MIN C:\TimeTrex\mysql\scripts\serviceinstall.bat)
if exist C:\TimeTrex\postgresql\scripts\serviceinstall.bat (start /MIN C:\TimeTrex\postgresql\scripts\serviceinstall.bat)
if exist C:\TimeTrex\apache2\scripts\serviceinstall.bat (start /MIN C:\TimeTrex\apache2\scripts\serviceinstall.bat)
if exist C:\TimeTrex\apache-tomcat\scripts\serviceinstall.bat (start /MIN C:\TimeTrex\apache-tomcat\scripts\serviceinstall.bat)
if exist C:\TimeTrex\openoffice\scripts\serviceinstall.bat (start /MIN C:\TimeTrex\openoffice\scripts\serviceinstall.bat)
if exist C:\TimeTrex\subversion\scripts\serviceinstall.bat (start /MIN C:\TimeTrex\subversion\scripts\serviceinstall.bat)
rem RUBY_APPLICATION_REMOVE
if exist C:\TimeTrex\lucene\scripts\serviceinstall.bat (start /MIN C:\TimeTrex\lucene\scripts\serviceinstall.bat)

:end
