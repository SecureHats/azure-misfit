# Managed Identity

This template creates a user-assigned managed Identity

## PowerShell
```PowerShell
New-AzDeployment `
  -name managedIdentity `
  -location 'westeurope' `
  -managedIdentityName 'remove-assignments'
  -TemplateObject ((Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/SecureHats/azure-misfit/azurekid/priv-esc/poc/priv-esc-arm-template/pre-req/managed-identity.json').Content | ConvertFrom-Json -AsHashtable)
```
