@echo off
:loop
echo Starting Flutter with FVM...
fvm flutter run
echo.
echo App closed/crashed. Restarting in 3 seconds...
timeout /t 3 /nobreak >nul
goto loop