$appUrl = "https://raw.githubusercontent.com/<username>/<repo>/main/myapp.zip"

New-Item -ItemType Directory -Path "C:\Temp" -Force

Invoke-WebRequest `
-Uri $appUrl `
-OutFile "C:\Temp\myapp.zip"

Expand-Archive `
-Path "C:\Temp\myapp.zip" `
-DestinationPath "C:\inetpub\wwwroot\MyApp" `
-Force

iisreset
