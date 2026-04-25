# Project Organization Script
$projectRoot = "G:\Odogwu Automobile"

Write-Host "Starting project organization..." -ForegroundColor Green
Write-Host ""

# Create assets folder
$assetsFolder = Join-Path -Path $projectRoot -ChildPath "assets"
if (-not (Test-Path -Path $assetsFolder)) {
    New-Item -ItemType Directory -Path $assetsFolder | Out-Null
    Write-Host "Created 'assets' folder" -ForegroundColor Green
} else {
    Write-Host "'assets' folder already exists" -ForegroundColor Yellow
}

# Move image files
$images = @("logo.jpg", "CAR LOGOS.jpg")
foreach ($img in $images) {
    $source = Join-Path -Path $projectRoot -ChildPath $img
    if (Test-Path -Path $source) {
        $dest = Join-Path -Path $assetsFolder -ChildPath $img
        Move-Item -Path $source -Destination $dest -Force
        Write-Host "Moved '$img' to assets" -ForegroundColor Green
    } else {
        Write-Host "'$img' not found" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "Organization complete!" -ForegroundColor Green
Write-Host ""
Write-Host "New project structure:" -ForegroundColor Cyan
Get-ChildItem -Path $projectRoot -Force | Where-Object {$_.Name -ne ".git"} | Format-Table -Property Name
