
PowerShell -Command "& {Remove-Item C:\Work\Exports\CrmStone\Solutions\* -recurse}"
REM PowerShell -Command "& {Remove-Item C:\Work\Exports\CrmStone\Solutions\Update\* -recurse}"

echo --- Export the solution
PowerShell -command ".\Export-Dev.ps1"

echo --- Unpacking the solution
..\Tools\SolutionPackager\SolutionPackager.exe /action:extract /allowWrite:Yes  /zipfile:C:\Work\Exports\CrmStone\Solutions\Core.zip /folder:"C:\Work\Exports\CrmStone\Solutions\Core" /log:"C:\Work\Exports\CrmStone\Solutions\Extract_log.txt"

robocopy C:\Work\Exports\CrmStone\Solutions\Core ..\Customizations\Dev\Solutions\Core /mir

echo --- Load Visual Studio variables for TFS commands
echo %vs140comntools%
call "%vs140comntools%vsvars32.bat"

REM tf add ..\Customizations\Dev\*.* /recursive /noignore
REM tf folderdiff ..\Customizations\Dev /recursive /view:sourceOnly

REM tf checkin ..\Development\CRM\*.* /recursive /comment:"Extract From Dev"

pause
