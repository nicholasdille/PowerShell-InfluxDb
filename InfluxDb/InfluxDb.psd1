@{
    RootModule = 'InfluxDb.psm1'
    ModuleVersion = '0.5.14.17'
    GUID = '509f5167-efb3-4cd2-b9ca-2bbe12d30393'
    Author = 'Nicholas Dille'
    # CompanyName = ''
    Copyright = '(c) 2017 Nicholas Dille. All rights reserved.'
    Description = 'Cmdlets for managing InfluxDB'
    PowerShellVersion = '5.0'
    FunctionsToExport = @(
        'Add-InfluxDbPrivilege'
        'Get-InfluxDbDatabase'
        'Get-InfluxDbField'
        'Get-InfluxDbMeasurement'
        'Get-InfluxDbPrivilege'
        'Get-InfluxDbSubscription'
        'Get-InfluxDbUser'
        'New-InfluxDbDatabase'
        'New-InfluxDbUser'
        'Remove-InfluxDbDatabase'
        'Remove-InfluxDbMeasurement'
        'Remove-InfluxDbPrivilege'
        'Remove-InfluxDbSubscription'
        'Remove-InfluxDbUser'
        'Set-InfluxDbServer'
    )
    RequiredModules = @(
        @{
            ModuleName = 'WebRequest'
            RequiredVersion = '0.2.0.26'
        }
    )
    CmdletsToExport = ''
    VariablesToExport = ''
    #AliasesToExport = @()
    #FormatsToProcess = @()
    PrivateData = @{
        PSData = @{
            Tags = @()
            LicenseUri = 'https://github.com/nicholasdille/PowerShell-InfluxDb/blob/master/LICENSE'
            ProjectUri = 'https://github.com/nicholasdille/PowerShell-InfluxDb'
            ReleaseNotes = 'https://github.com/nicholasdille/PowerShell-InfluxDb/releases'
        }
    }
}
