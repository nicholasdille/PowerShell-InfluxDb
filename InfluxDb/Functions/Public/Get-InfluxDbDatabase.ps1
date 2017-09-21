function Get-InfluxDbDatabase {
    [CmdletBinding()]
    param()
    
    Invoke-InfluxDbApi -Query 'SHOW DATABASES'
}