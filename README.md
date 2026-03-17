# keyvaultdemo

Small Azure demo repository for provisioning a Windows VM with an ARM template and pulling the VM admin password from Azure Key Vault.

## What is in this repo

- `deploy.json`: ARM template that creates a Windows VM, VNet, subnet, NSG, NIC, public IP, and a storage account for boot diagnostics.
- `deployparam.json`: ARM parameters file. It sets the admin username directly and resolves the admin password from an Azure Key Vault secret.
- `go.ps1`: Main deployment script for creating a resource group, deploying the template, and then cleaning up the demo resources.
- `createvm.ps1`: Alternate demo flow using `New-AzVm` directly instead of the ARM template.
- `chpw.ps1`: Helper script to reset the VM password using the VM access extension.
- `vsize.ps1`: Helper script to resize the deployed VM.

## Prerequisites

- PowerShell 7 or Windows PowerShell with the Azure PowerShell `Az` modules installed
- An Azure subscription you can deploy into
- Permission to:
  - create resource groups and VM/network/storage resources
  - read the Key Vault secret referenced in `deployparam.json`
- An authenticated Azure session, or permission to sign in with `Connect-AzAccount`

Useful setup commands:

```powershell
Install-Module Az -Scope CurrentUser
Connect-AzAccount
```

## Main deployment flow

The primary workflow is `go.ps1`:

```powershell
pwsh ./go.ps1
```

What it does:

1. Connects to Azure if no active context exists.
2. Selects the hard-coded subscription.
3. Creates a resource group in `northeurope`.
4. Deploys `deploy.json` with `deployparam.json`.
5. Waits for input, then deletes the resource group.

The deployment uses:

- Subscription ID from `go.ps1`
- Resource group name from `go.ps1`
- Key Vault secret reference from `deployparam.json`

## ARM template details

`deploy.json` provisions:

- a Windows Server VM named `keyvaultvm` by default
- a public IP with a DNS label
- an NSG with inbound RDP (`3389`) allowed
- a VNet and subnet
- a NIC attached to the subnet and public IP
- a storage account for boot diagnostics
- one empty 1023 GB data disk

The template outputs the public hostname of the VM after deployment.

## Key Vault parameter configuration

`deployparam.json` expects the admin password to come from an existing Azure Key Vault secret:

- Key Vault resource ID: `/subscriptions/ef17a603-a390-49bd-946c-cc18aa67f388/resourceGroups/rg-keyvault-deploy-sandb-we-001/providers/Microsoft.KeyVault/vaults/keyvaulteje`
- Secret name: `azvmpassword`

Before running the deployment, make sure:

- the Key Vault exists
- the secret exists
- the deploying identity can read that secret during ARM deployment

If you want to use a different vault or secret, update `deployparam.json`.

## Helper scripts

### `createvm.ps1`

Creates a demo VM directly with `New-AzVm` in `westeurope`, opens ports `80` and `3389`, waits for input, and deletes the resource group afterward.

### `chpw.ps1`

Uses `Set-AzVMAccessExtension` to reset credentials on an existing VM.

```powershell
pwsh ./chpw.ps1
```

### `vsize.ps1`

Fetches an existing VM, changes the size to `Standard_D2s_v3`, and updates it.

```powershell
pwsh ./vsize.ps1
```

## Safety notes

- `go.ps1` removes both the demo resource group and `NetworkWatcherRG` during cleanup. Review that before running it in any shared subscription.
- Several scripts contain hard-coded tenant IDs, subscription IDs, resource group names, VM names, and locations. Adjust them to your environment before use.
- The helper scripts do not all target the same resource group and VM names, so they may not operate on the VM created by `go.ps1` without edits.
- The repo currently has no tests, CI pipeline, or validation script.
- The template metadata shows it was generated from Bicep, but the original `.bicep` source file is not included here.

## Suggested first-run checklist

1. Review the subscription, tenant, location, and resource group values in `go.ps1`.
2. Verify the Key Vault ID and secret name in `deployparam.json`.
3. Confirm you are comfortable with the cleanup commands in `go.ps1`.
4. Sign in with `Connect-AzAccount` if needed.
5. Run `pwsh ./go.ps1`.

## File references

- [deploy.json](/Users/ericlaar/Documents/dev/keyvaultdemo/deploy.json)
- [deployparam.json](/Users/ericlaar/Documents/dev/keyvaultdemo/deployparam.json)
- [go.ps1](/Users/ericlaar/Documents/dev/keyvaultdemo/go.ps1)
- [createvm.ps1](/Users/ericlaar/Documents/dev/keyvaultdemo/createvm.ps1)
- [chpw.ps1](/Users/ericlaar/Documents/dev/keyvaultdemo/chpw.ps1)
- [vsize.ps1](/Users/ericlaar/Documents/dev/keyvaultdemo/vsize.ps1)
