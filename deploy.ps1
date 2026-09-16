Install-WindowsFeature Web-Server -IncludeManagementTools

New-Item -ItemType Directory -Path C:\inetpub\wwwroot -Force

Set-Content `
 -Path C:\inetpub\wwwroot\index.html `
 -Value "VMSS Auto Deployment Success"
