Set-Location $PSScriptRoot
wsl -d Ubuntu -u root --cd "$PSScriptRoot" -- bash check.sh
python mk8xp.py
$env:PYTHONIOENCODING="utf-8"
python regress.py
