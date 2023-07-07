[CmdletBinding()]
param (
    [Parameter()]
    [string]$subscriptionId,

    [Parameter()]
    [string]$principalId,

    [Parameter()]
    [string]$roleDefinition = '8e3af657-a8ff-443c-a75c-2fe8c4bcb635'
)

$token = (Get-AzAccessToken).token
$headers = @{"Authorization"="Bearer $token"}
$guid = (New-Guid).Guid

$payload = @{
    properties = @{
        roleDefinitionId = "/subscriptions/$subscriptionId/providers/Microsoft.Authorization/roleDefinitions/$roleDefinition"
        principalId      = $principalId
        principalType    = "user"
    }
} | ConvertTo-Json -Depth 10 -Compress

$uri = "https://management.azure.com/subscriptions/$($subscriptionId)/providers/Microsoft.Authorization/roleAssignments/$($guid)?api-version=2022-04-01"

$result = Invoke-RestMethod `
    -uri $uri `
    -Body $payload `
    -ContentType 'application/json' `
    -Method 'PUT' `
    -headers $headers

Write-Host "token: [$token]"
Write-Host "payload: [$payload]"
Write-Host "URI: [$uri]"
write-host "Result: $result"

Write-Host "Clear Deployment History"
DELETE https://management.azure.com/subscriptions/$($subscriptionId)/resourcegroups/{resourceGroupName}/providers/Microsoft.Resources/deployments/{deploymentName}?api-version=2021-04-01
