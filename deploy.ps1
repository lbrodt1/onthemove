# On the Move - Deploy Script
# Runs from wherever this file lives, so it works on any machine / user account.
$repoPath = $PSScriptRoot
if (-not $repoPath) { $repoPath = (Get-Location).Path }
Set-Location $repoPath

Write-Host "On the Move - Deploy" -ForegroundColor Cyan
Write-Host "====================" -ForegroundColor Cyan

# Normalise smart punctuation to plain ASCII so the commit message can't get
# mangled when PowerShell hands it to git on any locale.
function ConvertTo-Ascii([string]$s) {
    if (-not $s) { return "" }
    $map = @{
        ([char]0x2014) = '-';   ([char]0x2013) = '-';   ([char]0x2022) = '-'
        ([char]0x00B7) = '-';   ([char]0x2192) = '->';  ([char]0x2026) = '...'
        ([char]0x2018) = "'";   ([char]0x2019) = "'";   ([char]0x201C) = '"';  ([char]0x201D) = '"'
    }
    foreach ($k in $map.Keys) { $s = $s.Replace([string]$k, $map[$k]) }
    return (-join ($s.ToCharArray() | Where-Object { [int]$_ -lt 128 }))
}

# Build a clean commit subject + body from the top CHANGELOG entry
$subject = ""
$body    = ""
$version = ""
try {
    $html = Get-Content "index.html" -Raw -Encoding UTF8
    if ($html -match 'nav-version[^>]*>(v[\d\.]+)<') { $version = $matches[1] }

    $cl = Get-Content "CHANGELOG.md" -Raw -Encoding UTF8 -ErrorAction SilentlyContinue
    if ($cl -match '(?s)###\s+(v[\d\.][^\r\n]+)\r?\n([^\r\n]+)\r?\n([\s\S]+?)(?=\r?\n---|\z)') {
        $verLine = $matches[1].Trim()
        $title   = $matches[2].Trim().Trim('*').Trim()
        $bodyRaw = $matches[3]                                  # capture before next -match
        $ver     = if ($verLine -match '^(v[\d\.]+)') { $matches[1] } else { $verLine }
        $items   = $bodyRaw -split "`n" |
                   Where-Object { $_ -match '^\s*-' } |
                   Select-Object -First 3 |
                   ForEach-Object { '- ' + ($_.Trim().TrimStart('-').Trim()) }
        $subject = ConvertTo-Ascii "$ver - $title"
        $body    = ConvertTo-Ascii ($items -join "`n")
    }
} catch {}

if (-not $subject) { $subject = if ($version) { "$version update" } else { "update" } }

# Git status
$status = git status --short
if ($status) {
    Write-Host "`nChanges to commit:" -ForegroundColor Green
    Write-Host $status
    Write-Host "`nSuggested commit message:" -ForegroundColor Yellow
    Write-Host "  $subject" -ForegroundColor White
    if ($body) { ($body -split "`n") | ForEach-Object { Write-Host "    $_" -ForegroundColor DarkGray } }
    $custom = Read-Host "`nCommit message (Enter to use suggested)"

    git add -A
    # -c core.editor=true prevents the commit from hanging on an editor window
    if ($custom) {
        git -c core.editor=true commit -m $custom
    } elseif ($body) {
        git -c core.editor=true commit -m $subject -m $body
    } else {
        git -c core.editor=true commit -m $subject
    }
    git push

    Write-Host "`nDeployed! GitHub Pages rebuilds in ~60 seconds." -ForegroundColor Green
} else {
    Write-Host "`nNo changes to deploy." -ForegroundColor Yellow
}

Write-Host "`nPress any key to close..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
