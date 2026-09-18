# Install IIS
Install-WindowsFeature -Name Web-Server -IncludeManagementTools

# Create Temp folder
New-Item -ItemType Directory -Path "C:\Temp" -Force

# Download application package
$zipUrl = "https://raw.githubusercontent.com/NaniPrasadNani/IAC_Terraform/main/wwwroot.zip"

Invoke-WebRequest `
    -Uri $zipUrl `
    -OutFile "C:\Temp\wwwroot.zip"

# Clear default IIS files
Remove-Item "C:\inetpub\wwwroot\*" -Recurse -Force -ErrorAction SilentlyContinue

# Extract website
Expand-Archive `
    -Path "C:\Temp\wwwroot.zip" `
    -DestinationPath "C:\inetpub\wwwroot" `
    -Force

# Start IIS
Start-Service W3SVC

Write-Host "Application deployment completed successfully."
