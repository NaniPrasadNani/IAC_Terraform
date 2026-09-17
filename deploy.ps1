# Create Temp folder
New-Item -ItemType Directory -Path "C:\Temp" -Force

# URL of website package
$zipUrl = "https://raw.githubusercontent.com/NaniPrasadNani/IAC_Terraform/main/wwwroot.zip"

# Download application package
Invoke-WebRequest `
    -Uri $zipUrl `
    -OutFile "C:\Temp\wwwroot.zip"

# Extract application files to IIS root
Expand-Archive `
    -Path "C:\Temp\wwwroot.zip" `
    -DestinationPath "C:\inetpub\wwwroot" `
    -Force

# Restart IIS
iisreset

Write-Host "Application deployment completed successfully."
