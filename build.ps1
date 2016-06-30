Param(
    [string]$Script = "build.cake",
    [string]$Target = "Default",
    [ValidateSet("Release", "Debug")]
    [string]$Configuration = "Release",
    [ValidateSet("Quiet", "Minimal", "Normal", "Verbose", "Diagnostic")]
    [string]$Verbosity = "Verbose",
    [string]$Platform,
    [switch]$Experimental,
    [switch]$LockCommon,
    [switch]$WhatIf
)

$TOOLS_DIR = Join-Path $PSScriptRoot "tools"
$NUGET_EXE = Join-Path $TOOLS_DIR "nuget.exe"
$CAKE_EXE = Join-Path $TOOLS_DIR "Cake/Cake.exe"

# Should we use experimental build of Roslyn?
$UseExperimental = "";
if($Experimental.IsPresent) {
    $UseExperimental = "-experimental"
}

# Is this a dry run?
$UseDryRun = "";
if($WhatIf.IsPresent) {
    $UseDryRun = "-dryrun"
}

# Try download NuGet.exe if do not exist.
if (!(Test-Path $NUGET_EXE)) {
    Invoke-WebRequest -Uri http://nuget.org/nuget.exe -OutFile $NUGET_EXE
}

# Make sure NuGet exists where we expect it.
if (!(Test-Path $NUGET_EXE)) {
    Throw "Could not find NuGet.exe"
}
    
Invoke-Expression "$NUGET_EXE update -self"


# Restore tools from NuGet.
Push-Location
Set-Location $TOOLS_DIR

Invoke-Expression "$NUGET_EXE install -ExcludeVersion -OutputDirectory ."

if ((Test-Path addins\Microsoft.R.Build) -And -Not ($LockCommon.IsPresent)) {
    Remove-Item addins\Microsoft.R.Build -Recurse -Force
}

Pop-Location
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

# Make sure that Cake has been installed.
if (!(Test-Path $CAKE_EXE)) {
    Throw "Could not find Cake.exe"
}

$codeRoot = (split-path $MyInvocation.MyCommand.Path)

$platformFlag = if ($Platform) { "-platform=`"$Platform`"" } else { '' }

# Start Cake
Invoke-Expression "$CAKE_EXE `"$Script`" -target=`"$Target`" -configuration=`"$Configuration`" -verbosity=`"$Verbosity`" -codeRoot=`"$codeRoot`" $platformFlag $UseDryRun $UseExperimental"
Write-Host
exit $LASTEXITCODE