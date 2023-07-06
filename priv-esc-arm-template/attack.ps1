[CmdletBinding()]
param (
    [Parameter()]
    [string]$subscriptionId,

    [Parameter()]
    [string]$principalId,

    [Parameter()]
    [string]$roleDefinition = '8e3af657-a8ff-443c-a75c-2fe8c4bcb635',

    [Parameter()]
    [string]$guid
)

$token = (Get-AzAccessToken).token
$headers = @{"Authorization"="Bearer $token"}
$payload = '{"properties": {"roleDefinitionId": "/subscriptions/$subscriptionId/providers/Microsoft.Authorization/roleDefinitions/$roleDefinition","principalId": "$principalId","principalType": "User"}}'

Invoke-RestMethod -Uri 'https://management.azure.com/subscriptions/$subscriptionId/providers/Microsoft.Authorization/roleAssignments/$guid?api-version=2022-04-01' `
  -Headers $headers `
  -Body $payload `
  -ContentType 'application/json' `
  -Method PUT
