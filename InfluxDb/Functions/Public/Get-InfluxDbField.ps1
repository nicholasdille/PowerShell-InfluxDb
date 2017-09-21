function Get-InfluxDbField {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Database
    )
    
    Invoke-InfluxDbApi -Query 'SHOW FIELD KEYS' -Database $Database
}