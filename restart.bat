@echo off
CALL "C:\TimeTrex\stop.bat"
@ping 127.0.0.1 -n 10 -w 1000 > nul
CALL "C:\TimeTrex\start.bat"
							