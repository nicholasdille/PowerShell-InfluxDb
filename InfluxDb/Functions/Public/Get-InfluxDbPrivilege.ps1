function Get-InfluxDbPrivilege {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $User
    )
    
    Invoke-InfluxDbApi -Query "SHOW GRANTS FOR $User"
}