<# Notes:
In Windows 11 24H2 Multi-User, OOBE screens now appear at first admin login.
This script disables the following OOBE steps at first logon: 
- "Let Microsoft and apps use your location"
- "Find my device"
- "Send diagnostic data to Microsoft"
- "Improve inking & typing"
- "Get tailored experiences with diagnostic data"
- "Let apps use advertising ID"
- "Let Microsoft and apps use your location"
#>

$registryPaths = @{
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE"            = @{
        "DisablePrivacyExperience" = 1
        "DisableVoice"             = 1
        "PrivacyConsentStatus"     = 1
        "Protectyourpc"            = 3
        "HideEULAPage"             = 1
    }
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" = @{
        "EnableFirstLogonAnimation" = 1
    }
}

foreach ($path in $registryPaths.Keys) {
    foreach ($name in $registryPaths[$path].Keys) {
        New-ItemProperty -Path $path -Name $name -Value $registryPaths[$path][$name] -PropertyType DWord -Force
    }
}