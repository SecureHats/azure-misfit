[CmdletBinding()]
param (
    [Parameter()]
    [string]$subscriptionId,

    [Parameter()]
    [string]$principalId,

    [Parameter()]
    [string]$roleDefinition = '8e3af657-a8ff-443c-a75c-2fe8c4bcb635'
)

Write-Host "##[debug] Generating Access Token"
$token = (Get-AzAccessToken).token
$guid = (New-Guid).Guid

$payload = @{
    properties = @{
        roleDefinitionId = "/subscriptions/$subscriptionId/providers/Microsoft.Authorization/roleDefinitions/$roleDefinition"
        principalId      = $principalId
        principalType    = "user"
    }
}

Invoke-RestMethod `
    -uri "https://management.azure.com/subscriptions/$($subscriptionId)/providers/Microsoft.Authorization/roleAssignments/$($guid)?api-version=2022-04-01" `
    -body ($payload | ConvertTo-Json -Depth 10 -Compress)
    -contenttype 'application/json' `
    -method 'PUT'
    -headers @{"Authorization" = "Bearer $token"}

write-output $result
