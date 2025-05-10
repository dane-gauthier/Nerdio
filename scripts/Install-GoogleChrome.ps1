# Install-GoogleChrome.ps1
# Purpose: Install Google Chrome using winget with error checking and logging

# Function to write to log
function Write-Log {
    param (
        [string]$message,
        [string]$level = "INFO"
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Output "$timestamp [$level] - $message"
}

# Start log
Write-Log "Starting Google Chrome installation..."

# Check if winget is available
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Log "winget is not installed or not in PATH. Please install App Installer from Microsoft Store." "ERROR"
    exit 1
}

# Check if Chrome is already installed
$chromeInstalled = Get-StartApps | Where-Object { $_.Name -like "*Chrome*" }

if ($chromeInstalled) {
    Write-Log "Google Chrome is already installed. Skipping installation." "INFO"
    exit 0
}

# Attempt installation
try {
    Write-Log "Running winget to install Google Chrome..."
    $process = Start-Process -FilePath "winget" -ArgumentList 'install --id=Google.Chrome --silent --accept-package-agreements --accept-source-agreements' -Wait -NoNewWindow -PassThru

    if ($process.ExitCode -eq 0) {
        Write-Log "Google Chrome installed successfully." "SUCCESS"
    }
    else {
        Write-Log "winget exited with code $($process.ExitCode). Installation may have failed." "ERROR"
        exit $process.ExitCode
    }
}
catch {
    Write-Log "An unexpected error occurred: $_" "ERROR"
    exit 1
}
