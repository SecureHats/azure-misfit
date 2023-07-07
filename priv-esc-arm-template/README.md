# Project Miaow (Managed Identity Allows Owner)

![image](https://github.com/SecureHats/azure-misfit/assets/40334679/20947a9e-ec9a-4a3f-951e-0759eb043789)  

Mr. KFC Harland Sanders has contributor permissions on the User-Assigned Managed Identity

![image](https://github.com/SecureHats/azure-misfit/assets/40334679/8f7caaab-0a12-453c-af54-f7b7c28100f9)  

The User Assigned Managed Identity `super-owner` has permissions on the subscription level.

Other permissions that Harland has is contributor permissions a resource group, and no further permissions within the subscription.

Overview of all resource group access
![image](https://github.com/SecureHats/azure-misfit/assets/40334679/ae7e5a90-0627-4084-81e0-7045a87ac0cd)

Harland has no access to the Resource group where the user assigned managed idenity lives.

```json
{
    "id": "/subscriptions/7570c6f7-9ca9-409b-aeaf-cb0f5ac1ad50/providers/Microsoft.Authorization/roleDefinitions/ea1106ce-d1c4-4be0-88a6-6ee6e256da37",
    "properties": {
        "roleName": "Deployment Administrator",
        "description": "",
        "assignableScopes": [
            "/subscriptions/7570c6f7-9ca9-409b-aeaf-cb0f5ac1ad50"
        ],
        "permissions": [
            {
                "actions": [
                    "*/read",
                    "Microsoft.Resources/deployments/read",
                    "Microsoft.Resources/deployments/write",
                    "Microsoft.Resources/deployments/delete",
                    "Microsoft.Resources/deployments/cancel/action",
                    "Microsoft.Resources/deployments/validate/action",
                    "Microsoft.Resources/deployments/whatIf/action",
                    "Microsoft.Resources/deployments/exportTemplate/action",
                    "Microsoft.Resources/deployments/operationstatuses/read",
                    "Microsoft.Resources/deploymentScripts/read",
                    "Microsoft.Resources/deploymentScripts/write",
                    "Microsoft.Resources/deploymentScripts/delete",
                    "Microsoft.Resources/deploymentScripts/logs/read",
                    "Microsoft.Resources/deployments/operations/read"
                ],
                "notActions": [],
                "dataActions": [],
                "notDataActions": []
            }
        ]
    }
}
```

![image](https://github.com/SecureHats/azure-misfit/assets/40334679/cc4a43b2-6ba9-417b-9fc6-0eaa977157a4)

![image](https://github.com/SecureHats/azure-misfit/assets/40334679/cd905f95-c029-482d-a785-3737a41349ee)

![image](https://github.com/SecureHats/azure-misfit/assets/40334679/c977cd5b-e21a-4e43-9d82-40b14a385fce)


