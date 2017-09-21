function New-InfluxDbUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $User
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Password
    )
    
    Invoke-InfluxDbApi -Query "CREATE USER $User WITH PASSWORD '$Password'" -Method Post
}