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
$token

$guid = (New-Guid).Guid

Write-Host "##[debug] Generating Payload"
$payload = @{
    properties = @{
        roleDefinitionId = "/subscriptions/$subscriptionId/providers/Microsoft.Authorization/roleDefinitions/$roleDefinition"
        principalId      = $principalId
        principalType    = "user"
    }
} | ConvertTo-Json -Depth 10 -Compress

Write-Host "##[debug] Generating URI"
$uri = "https://management.azure.com/subscriptions/$($subscriptionId)/providers/Microsoft.Authorization/roleAssignments/$($guid)?api-version=2022-04-01"
write-host $payload
write-host $uri

Write-Host "##[debug] Creating Assignment URI"
$result = Invoke-RestMethod `
    -uri $uri `
    -body $payload
    -contenttype 'application/json' `
    -method 'PUT'
    -headers @{"Authorization" = "Bearer $token"}

write-output $result
