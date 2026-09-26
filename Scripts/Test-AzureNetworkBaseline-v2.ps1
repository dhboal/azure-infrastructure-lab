<#
.SYNOPSIS
    Read-only inventory and basic network security checks for an Azure resource group.
.EXAMPLE
    ./Test-AzureNetworkBaseline.ps1 -ResourceGroupName RG-Lab-01 -VirtualNetworkName VNET-Lab-01
#>
param(
    [Parameter(Mandatory = $true)]
    [string] $ResourceGroupName,

    [Parameter(Mandatory = $true)]
    [string] $VirtualNetworkName
)

$ErrorActionPreference = 'Stop'
$vnet = Get-AzVirtualNetwork -ResourceGroupName $ResourceGroupName -Name $VirtualNetworkName
$nsgs = @(Get-AzNetworkSecurityGroup -ResourceGroupName $ResourceGroupName)
$storageAccounts = @(Get-AzStorageAccount -ResourceGroupName $ResourceGroupName)

$results = @(
    foreach ($subnet in $vnet.Subnets) {
        $nsgId = $subnet.NetworkSecurityGroup.Id
        [pscustomobject]@{
            Type     = 'Subnet'
            Resource = $subnet.Name
            Status   = if ($nsgId) { 'PASS' } else { 'REVIEW' }
            Detail   = if ($nsgId) { 'NSG: ' + ($nsgId -split '/')[-1] } else { 'No NSG associated' }
        }
    }

    foreach ($nsg in $nsgs) {
        $customRules = @($nsg.SecurityRules)
        [pscustomobject]@{
            Type     = 'NSG'
            Resource = $nsg.Name
            Status   = 'INFO'
            Detail   = "Custom rules: $($customRules.Count); Azure default rules still apply"
        }

        foreach ($rule in $customRules) {
            $sources = @($rule.SourceAddressPrefix) + @($rule.SourceAddressPrefixes)
            $ports = @($rule.DestinationPortRange) + @($rule.DestinationPortRanges)
            $internetSources = @($sources | Where-Object { $_ -in @('*', '0.0.0.0/0', 'Internet') })
            $remotePorts = @($ports | Where-Object { $_ -in @('*', '22', '3389') })
            if ($rule.Direction -eq 'Inbound' -and $rule.Access -eq 'Allow' -and
                $internetSources.Count -gt 0 -and $remotePorts.Count -gt 0) {
                [pscustomobject]@{
                    Type     = 'Rule'
                    Resource = "$($nsg.Name)/$($rule.Name)"
                    Status   = 'REVIEW'
                    Detail   = 'Internet-sourced inbound access includes all ports, SSH, or RDP'
                }
            }
        }
    }

    foreach ($account in $storageAccounts) {
        [pscustomobject]@{
            Type     = 'Storage'
            Resource = $account.StorageAccountName
            Status   = if ($account.EnableHttpsTrafficOnly -and $account.MinimumTlsVersion -eq 'TLS1_2' -and
                           $account.AllowBlobPublicAccess -eq $false) { 'PASS' } else { 'REVIEW' }
            Detail   = "HTTPS only: $($account.EnableHttpsTrafficOnly); TLS: $($account.MinimumTlsVersion); anonymous blobs: $($account.AllowBlobPublicAccess)"
        }
        $openNetwork = $account.PublicNetworkAccess -eq 'Enabled' -and
                       $account.NetworkRuleSet.DefaultAction -eq 'Allow'
        [pscustomobject]@{
            Type     = 'Storage network'
            Resource = $account.StorageAccountName
            Status   = if ($openNetwork) { 'REVIEW' } else { 'PASS' }
            Detail   = "Public network: $($account.PublicNetworkAccess); default action: $($account.NetworkRuleSet.DefaultAction)"
        }
    }
)

$results | Format-Table -AutoSize
