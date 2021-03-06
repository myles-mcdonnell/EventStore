param([string]$assemblyInfoFile)

if ($assemblyInfoFile -eq $null) {
	throw "No file passed. Usage: ./updateCommitHash.ps1 <filename>"
}

$maybeBackup = "$assemblyInfoFile.bak"
if ((Test-Path $maybeBackup) -eq $false) {
	$path = Resolve-Path $assemblyInfoFile -Relative
	& { git checkout $path }
} else {
	Move-Item -Force $maybeBackup $assemblyInfoFile
}

Write-Host "Reset commit hash in $assemblyInfoFile"