# On the Move — Deploy Script
$repoPath = "C:\Users\lbrod\OneDrive\Documents\onthemove"
Set-Location $repoPath

Write-Host "On the Move — Deploy" -ForegroundColor Cyan
Write-Host "====================" -ForegroundColor Cyan

# Auto-read latest version + changelog entry for commit message
$version = ""
$notes = ""
try {
    $html = Get-Content "index.html" -Raw
    if ($html -match 'nav-version[^>]*>(v[\d\.]+)<') { $version = $matches[1] }
    $cl = Get-Content "CHANGELOG.md" -Raw -ErrorAction SilentlyContinue
    if ($cl -match '(?s)###\s+(v[\d\.][^\n]+)\n([^\n]+)\n([-\s\S]+?)(?=\n---|\z)') {
        $clVersion = $matches[1].Trim()
        $clTitle = $matches[2].Trim()
        $clItems = ($matches[3] -split '\n' | Where-Object { $_ -match '^\s*-' } | Select-Object -First 3 | ForEach-Object { $_.Trim().TrimStart('-').Trim() }) -join '; '
        $notes = "$clVersion — $clTitle`: $clItems"
    }
} catch {}

$defaultMsg = if ($notes) { $notes } elseif ($version) { "$version update" } else { "update" }

# Git status
$status = git status --short
if ($status) {
    Write-Host "`nChanges to commit:" -ForegroundColor Green
    Write-Host $status
    Write-Host "`nSuggested commit message:" -ForegroundColor Yellow
    Write-Host "  $defaultMsg" -ForegroundColor White
    $msg = Read-Host "`nCommit message (Enter to use suggested)"
    if (-not $msg) { $msg = $defaultMsg }
    
    git add -A
    git commit -m $msg
    git push
    
    Write-Host "`nDeployed! GitHub Pages rebuilds in ~60 seconds." -ForegroundColor Green
} else {
    Write-Host "`nNo changes to deploy." -ForegroundColor Yellow
}

Write-Host "`nPress any key to close..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
