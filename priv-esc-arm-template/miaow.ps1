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

$payload = @{
    properties = @{
        roleDefinitionId = "/subscriptions/$subscriptionId/providers/Microsoft.Authorization/roleDefinitions/$roleDefinition"
        principalId      = $principalId
        principalType    = "user"
    }
} | ConvertTo-Json -Depth 10 -Compress

Write-Host $payload
$guid = (New-Guid).Guid

$requestParam = @{
    uri         = "https://management.azure.com/subscriptions/$($subscriptionId)/providers/Microsoft.Authorization/roleAssignments/$($guid)?api-version=2022-04-01"
    headers     = @{"Authorization" = "Bearer $token"}
    # body        = $payload
    # contenttype = 'application/json'
    method      = 'GET'
}

$result = Invoke-RestMethod @requestParam
# write-output $result
