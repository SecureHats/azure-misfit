# Install-Module AZ.Accounts -RequiredVersion 2.12.3 -Force
# Import-Module Az.Resources -Force
# New-AzRoleAssignment -SignInName 'h.sanders@securehats.nl' -Scope '/subscriptions/7570c6f7-9ca9-409b-aeaf-cb0f5ac1ad50' -RoleDefinitionName 'Owner'
$token = (Get-AzAccessToken).token
$headers = @{"Authorization"="Bearer $token"}
$payload = '{"properties": {"roleDefinitionId": "/subscriptions/a925f2f7-5c63-4b7b-8799-25a5f97bc3b2/providers/Microsoft.Authorization/roleDefinitions/8e3af657-a8ff-443c-a75c-2fe8c4bcb635","principalId": "301dfac7-8f45-48ac-9868-e1f0e875385c","principalType": "User"}}'

Invoke-RestMethod -Uri 'https://management.azure.com/subscriptions/7570c6f7-9ca9-409b-aeaf-cb0f5ac1ad50/providers/Microsoft.Authorization/roleAssignments/05c5a614-a7d6-4502-b150-c2fb455033ff?api-version=2022-04-01' `
  -Headers $headers `
  -Body $payload `
  -ContentType 'application/json' `
  -Method PUT
