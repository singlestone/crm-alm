
IF "%vs140comntools%".=="". GOTO VS11
call "%vs140comntools%vsvars32.bat"
GOTO VSLoaded

:VS11
call "%vs110comntools%vsvars32.bat"

:VSLoaded
tf get  ../Customizations/Dev/*.* /recursive
tf merge /recursive ../Customizations/Dev/ ../Customizations/Test

PowerShell -Command ".\convertToTest.ps1 -customizationsPath \"../Customizations/Test/\"" || goto :error

tf checkin ..\Customizations\Test\* /recursive /comment:"Merge from Dev"
GOTO EOF

:error
echo Failed with error #%errorlevel%.
pause
exit /b %errorlevel%

:EOF
pause