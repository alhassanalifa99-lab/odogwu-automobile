# Project Organization Script
# This script organizes the Odogwu Automobile project structure

$projectRoot = "G:\Odogwu Automobile"

Write-Host "Starting project organization..." -ForegroundColor Green

# Step 1: Create assets folder if it doesn't exist
$assetsFolder = Join-Path -Path $projectRoot -ChildPath "assets"
if (-not (Test-Path -Path $assetsFolder)) {
    New-Item -ItemType Directory -Path $assetsFolder | Out-Null
    Write-Host "✓ Created 'assets' folder" -ForegroundColor Green
} else {
    Write-Host "✓ 'assets' folder already exists" -ForegroundColor Yellow
}

# Step 2: Move image files to assets folder
$imagesToMove = @("logo.jpg", "CAR LOGOS.jpg")

foreach ($image in $imagesToMove) {
    $sourcePath = Join-Path -Path $projectRoot -ChildPath $image
    if (Test-Path -Path $sourcePath) {
        $destinationPath = Join-Path -Path $assetsFolder -ChildPath $image
        Move-Item -Path $sourcePath -Destination $destinationPath -Force
        Write-Host "✓ Moved '$image' to assets folder" -ForegroundColor Green
    } else {
        Write-Host "⚠ '$image' not found" -ForegroundColor Yellow
    }
}

# Step 3: Verify final structure
Write-Host "`nProject structure organized successfully!" -ForegroundColor Green
Write-Host "`nFinal structure:" -ForegroundColor Cyan
Get-ChildItem -Path $projectRoot -Force | Where-Object { $_.Name -ne ".git" } | ForEach-Object {
    $type = if ($_.PSIsContainer) { "Folder" } else { "File" }
    [PSCustomObject]@{ Name = $_.Name; Type = $type }
} | Format-Table -AutoSize
