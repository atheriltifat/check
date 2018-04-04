@echo off
rem START or STOP Services
rem ----------------------------------
rem Check if argument is STOP or START

if not ""%1"" == ""START"" goto stop

if exist C:\TimeTrex\hypersonic\scripts\servicerun.bat (start /MIN C:\TimeTrex\server\hsql-sample-database\scripts\servicerun.bat START)
if exist C:\TimeTrex\ingres\scripts\servicerun.bat (start /MIN C:\TimeTrex\ingres\scripts\servicerun.bat START)
if exist C:\TimeTrex\mysql\scripts\servicerun.bat (start /MIN C:\TimeTrex\mysql\scripts\servicerun.bat START)
if exist C:\TimeTrex\postgresql\scripts\servicerun.bat (start /MIN C:\TimeTrex\postgresql\scripts\servicerun.bat START)
if exist C:\TimeTrex\apache2\scripts\servicerun.bat (start /MIN C:\TimeTrex\apache2\scripts\servicerun.bat START)
if exist C:\TimeTrex\openoffice\scripts\servicerun.bat (start /MIN C:\TimeTrex\openoffice\scripts\servicerun.bat START)
if exist C:\TimeTrex\apache-tomcat\scripts\servicerun.bat (start /MIN C:\TimeTrex\apache-tomcat\scripts\servicerun.bat START)
if exist C:\TimeTrex\jetty\scripts\servicerun.bat (start /MIN C:\TimeTrex\jetty\scripts\servicerun.bat START)
if exist C:\TimeTrex\subversion\scripts\servicerun.bat (start /MIN C:\TimeTrex\subversion\scripts\servicerun.bat START)
rem RUBY_APPLICATION_START
if exist C:\TimeTrex\lucene\scripts\servicerun.bat (start /MIN C:\TimeTrex\lucene\scripts\servicerun.bat START)
goto end

:stop

if exist C:\TimeTrex\lucene\scripts\servicerun.bat (start /MIN C:\TimeTrex\lucene\scripts\servicerun.bat STOP)
rem RUBY_APPLICATION_STOP
if exist C:\TimeTrex\subversion\scripts\servicerun.bat (start /MIN C:\TimeTrex\subversion\scripts\servicerun.bat STOP)
if exist C:\TimeTrex\jetty\scripts\servicerun.bat (start /MIN C:\TimeTrex\jetty\scripts\servicerun.bat STOP)
if exist C:\TimeTrex\hypersonic\scripts\servicerun.bat (start /MIN C:\TimeTrex\server\hsql-sample-database\scripts\servicerun.bat STOP)
if exist C:\TimeTrex\apache-tomcat\scripts\servicerun.bat (start /MIN C:\TimeTrex\apache-tomcat\scripts\servicerun.bat STOP)
if exist C:\TimeTrex\openoffice\scripts\servicerun.bat (start /MIN C:\TimeTrex\openoffice\scripts\servicerun.bat STOP)
if exist C:\TimeTrex\apache2\scripts\servicerun.bat (start /MIN C:\TimeTrex\apache2\scripts\servicerun.bat STOP)
if exist C:\TimeTrex\ingres\scripts\servicerun.bat (start /MIN C:\TimeTrex\ingres\scripts\servicerun.bat STOP)
if exist C:\TimeTrex\mysql\scripts\servicerun.bat (start /MIN C:\TimeTrex\mysql\scripts\servicerun.bat STOP)
if exist C:\TimeTrex\postgresql\scripts\servicerun.bat (start /MIN C:\TimeTrex\postgresql\scripts\servicerun.bat STOP)

:end
