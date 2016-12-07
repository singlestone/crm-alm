
del /Q C:\Work\Exports\CrmStone\Solutions\Core-UAT-pkd.zip 


..\Tools\SolutionPackager\SolutionPackager.exe /action:pack /zipfile:C:\Work\Exports\CrmStone\Solutions\Core-UAT-pkd.zip /folder:"..\Customizations\Dev\Solutions\Core"  || goto :error


echo --- Import the solution
PowerShell -command ".\Import-UAT.ps1" 

pause
goto EOF


:error
echo Failed with error #%errorlevel%.
pause
exit /b %errorlevel%

:EOF