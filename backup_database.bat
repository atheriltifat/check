@echo off
FOR /F "TOKENS=1* DELIMS= " %%A IN ('DATE/T') DO SET CDATE=%%B
FOR /F "TOKENS=1,2 eol=/ DELIMS=/ " %%A IN ('DATE/T') DO SET mm=%%B
FOR /F "TOKENS=1,2 DELIMS=/ eol=/" %%A IN ('echo %CDATE%') DO SET dd=%%B
FOR /F "TOKENS=2,3 DELIMS=/ " %%A IN ('echo %CDATE%') DO SET yyyy=%%B
SET date=%yyyy%%mm%%dd%
SET PGPASSWORD=6d2bb03c2
SET PGDATABASE=timetrex
REM "C:/TimeTrex/postgresql\bin\pg_dumpall.exe" -c --column-inserts -h localhost -U postgres -p 5433 > "C:\TimeTrex\timetrex_database_%date%.sql"
"C:/TimeTrex/postgresql\bin\pg_dump.exe" -Fc --compress 9 --clean --create -h localhost -U postgres -p 5433 -f "C:\TimeTrex\timetrex_database_%date%.sql" timetrex
							