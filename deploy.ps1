# On the Move — Deploy Script
# Pulls latest index.html from Claude output URL and commits to GitHub
# Usage: double-click this file

$repoPath = "C:\Users\lbrod\OneDrive\Documents\onthemove"
Set-Location $repoPath

Write-Host "On the Move — Deploy" -ForegroundColor Cyan
Write-Host "====================" -ForegroundColor Cyan

# Show current version
$current = Select-String -Path "index.html" -Pattern 'nav-version.*v[\d\.]+' | Select-Object -First 1
Write-Host "Current: $($current.Matches.Value)" -ForegroundColor Yellow

# Git status
$status = git status --short
if ($status) {
    Write-Host "`nChanges to commit:" -ForegroundColor Green
    Write-Host $status
    
    $msg = Read-Host "`nCommit message (Enter to use 'update')"
    if (-not $msg) { $msg = "update" }
    
    git add -A
    git commit -m $msg
    git push
    
    Write-Host "`nDeployed! GitHub Pages rebuilds in ~60 seconds." -ForegroundColor Green
} else {
    Write-Host "`nNo changes to deploy." -ForegroundColor Yellow
}

Write-Host "`nPress any key to close..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
