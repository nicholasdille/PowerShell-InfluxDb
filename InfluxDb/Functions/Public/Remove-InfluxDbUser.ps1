function Remove-InfluxDbUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $User
    )
    
    Invoke-InfluxDbApi -Query "DROP USER $User" -Method Post
}