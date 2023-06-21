Install-Module AZ.Accounts -RequiredVersion 2.12.3 -Force
Import-Module Az.Resources -Force
New-AzRoleAssignment -SignInName 'h.sanders@securehats.nl' -Scope '/subscriptions/7570c6f7-9ca9-409b-aeaf-cb0f5ac1ad50' -RoleDefinitionName 'Owner'
