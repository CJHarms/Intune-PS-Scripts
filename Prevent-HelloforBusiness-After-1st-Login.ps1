$path = 'HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork'
$key = try {
    Get-Item -Path $path -ErrorAction Stop
}
catch {
    New-Item -Path $path -Force
}

New-ItemProperty -Path $key.PSPath -Name DisablePostLogonProvisioning -PropertyType DWORD -Value 1