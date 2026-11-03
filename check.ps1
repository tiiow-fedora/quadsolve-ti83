Set-Location "C:\Users\user\quadsolve"
wsl -d Ubuntu -u root --cd "C:\Users\user\quadsolve" -- bash check.sh
python mk8xp.py
$env:PYTHONIOENCODING="utf-8"
python regress.py
