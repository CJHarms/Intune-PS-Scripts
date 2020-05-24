Remove-NetFirewallRule -Displayname "teams.exe"

$profiles = Get-ChildItem -Path 'C:\Users' -Directory
Foreach ($profile in $profiles) {
    $ExePath = Join-Path -Path $profile.Fullname -ChildPath 'AppData\Local\Microsoft\Teams\current\teams.exe'
    if (Test-Path $ExePath) {
        Write-Output "Teams exists"
        New-NetFirewallRule -Displayname "teams.exe" -Direction Inbound -Program $ExePath -Profile 'Domain, Private, Public'
    }
}