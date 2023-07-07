# Project Miaow (Managed Identity Adds Owner)

![image](https://github.com/SecureHats/azure-misfit/assets/40334679/20947a9e-ec9a-4a3f-951e-0759eb043789)  

Mr. KFC Harland Sanders has contributor permissions on the User-Assigned Managed Identity

![image](https://github.com/SecureHats/azure-misfit/assets/40334679/8f7caaab-0a12-453c-af54-f7b7c28100f9)  

The User Assigned Managed Identity `super-owner` has permissions on the subscription level.

Other permissions that Harland has is contributor permissions a resource group, and no further permissions within the subscription.

Overview of all resource group access
![image](https://github.com/SecureHats/azure-misfit/assets/40334679/ae7e5a90-0627-4084-81e0-7045a87ac0cd)

Harland has no access to the Resource group where the user assigned managed identity resides.

```json
{
  "roleName": "Deployment Administrator",
  "description": "Configure least privilege for the deployment principal in deployment script",
  "type": "customRole",
  "IsCustom": true,
  "permissions": [
    {
      "actions": [
        "Microsoft.Storage/storageAccounts/*",
        "Microsoft.ContainerInstance/containerGroups/*",
        "Microsoft.Resources/deployments/*",
        "Microsoft.Resources/deploymentScripts/*"
      ],
    }
  ],
  "assignableScopes": [
    "[subscription().id]"
  ]
}
```

![image](https://github.com/SecureHats/azure-misfit/assets/40334679/cc4a43b2-6ba9-417b-9fc6-0eaa977157a4)

![image](https://github.com/SecureHats/azure-misfit/assets/40334679/cd905f95-c029-482d-a785-3737a41349ee)

![image](https://github.com/SecureHats/azure-misfit/assets/40334679/c977cd5b-e21a-4e43-9d82-40b14a385fce)


