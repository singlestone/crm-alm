param([string]$customizationsPath)

$mapInitial = "flightaware.com/miserymap/KBWI"
$mapTarget = "flightaware.com/miserymap/KBWI"
#$mapTarget = "flightaware.com/miserymap/KSFO"
# $cacheInitial = "devservice.singlestonedemo.com"
# $cacheTarget = "devservice.singlestonedemo.com"

$files=get-childitem $customizationsPath/Entities *.xml -rec | Where-Object { $_ | Select-String -Pattern $mapInitial }
if ($files -ne $null) {
	foreach ($file in $files)
	{
	Write-Host $file.PSPath
	(Get-Content $file.PSPath) | 
	Foreach-Object {$_ -replace $mapInitial, $mapTarget} | 
	Set-Content $file.PSPath
	}
}

# $files=get-childitem $customizationsPath/WebResources *.js -rec | Where-Object { $_ | Select-String -Pattern $cspInitial }
# if ($files -ne $null) {
	# foreach ($file in $files)
	# {
	# Write-Host $file.PSPath
	# (Get-Content $file.PSPath) | 
	# Foreach-Object {$_ -replace $cspInitial, $cspTarget} | 
	# Set-Content $file.PSPath
	# }
# }

# $files=get-childitem $customizationsPath/Dashboards *.xml -rec | Where-Object { $_ | Select-String -Pattern $mapInitial }
# if ($files -ne $null) {
	# foreach ($file in $files)
	# {
	# Write-Host $file.PSPath
	# (Get-Content $file.PSPath) | 
	# Foreach-Object {$_ -replace $mapInitial, $mapTarget} | 
	# Set-Content $file.PSPath
	# }
# }

# $files=get-childitem $customizationsPath/Dashboards *.xml -rec | Where-Object { $_ | Select-String -Pattern $repInitial }
# if ($files -ne $null) {
	# foreach ($file in $files)
	# {
	# Write-Host $file.PSPath
	# (Get-Content $file.PSPath) | 
	# Foreach-Object {$_ -replace $repInitial, $repTarget} | 
	# Set-Content $file.PSPath
	# }
# }

# $files=get-childitem $customizationsPath/WebResources *.html -rec | Where-Object { $_ | Select-String -Pattern $cacheInitial }
# if ($files -ne $null) {
	# foreach ($file in $files)
	# {
	# Write-Host $file.PSPath
	# (Get-Content $file.PSPath) | 
	# Foreach-Object {$_ -replace $cacheInitial, $cacheTarget} | 
	# Set-Content $file.PSPath
	# }
# }

# $files=get-childitem $customizationsPath/WebResources *.html -rec | Where-Object { $_ | Select-String -Pattern $crmInitial }
# if ($files -ne $null) {
	# foreach ($file in $files)
	# {
	# Write-Host $file.PSPath
	# (Get-Content $file.PSPath) | 
	# Foreach-Object {$_ -replace $crmInitial, $crmTarget} | 
	# Set-Content $file.PSPath
	# }
# }

