function Get-InfluxDbMeasurement {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Database
    )
    
    Invoke-InfluxDbApi -Query 'SHOW MEASUREMENTS' -Database $Database
}