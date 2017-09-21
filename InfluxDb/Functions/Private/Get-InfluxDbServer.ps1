function Get-InfluxDbServer {
    [CmdletBinding()]
    param()

    if (-Not (Test-InfluxDbServer)) {
        throw 'Credentials not set. Please use Set-InfluxDbServer first.'
    }

    @{
        Server = $script:InfluxDbServer
        User   = $script:InfluxDbUser
        Token  = $script:InfluxDbToken
    }
}