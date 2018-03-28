function Get-InfluxDbSubscription {
    [CmdletBinding()]
    param()

    Invoke-InfluxDbApi -Query 'SHOW SUBSCRIPTIONS'
}