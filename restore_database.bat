@echo off
SET PGPASSWORD=6d2bb03c2
SET PGDATABASE=timetrex

IF "%1" == "" GOTO NOFILE
    echo.
    echo Attempting to restore SQL dump file: %1...
    echo.
    echo.
    echo -----WARNING-----WARNING-----WARNING-----WARNING-----
    echo.
    echo RESTORING THIS FILE WILL COMPLETELY OVERWRITE ALL EXISTING DATA...
    echo.
    echo ARE YOU SURE YOU WANT TO DO THIS?
    echo.
    echo -----WARNING-----WARNING-----WARNING-----WARNING-----
    echo.

    pause
    echo.
    echo NO REALLY, ALL EXISTING DATA WILL BE DELETED.
    echo.
    echo ARE YOU REALLY SURE YOU WANT TO DO THIS?
    echo.
    pause

    REM "C:/TimeTrex/postgresql\bin\psql.exe" -f "%1" -h localhost -U postgres -p 5433 template1
    "C:/TimeTrex/postgresql\bin\pg_restore.exe" -d template1 --clean --create --jobs 4 --if-exists -h localhost -U postgres -p 5433 "%1"
    echo Done.
    echo.

    GOTO END
:NOFILE
  echo.
  echo ERROR: Please specify the SQL dump file that you wish to restore.
:END
							