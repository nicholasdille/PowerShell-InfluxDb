function Get-InfluxDbUser {
    [CmdletBinding()]
    param()
    
    Invoke-InfluxDbApi -Query 'SHOW USERS'
}