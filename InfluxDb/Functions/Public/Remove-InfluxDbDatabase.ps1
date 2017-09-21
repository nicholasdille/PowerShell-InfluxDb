function Remove-InfluxDbDatabase {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Database
    )
    
    Invoke-InfluxDbApi -Query "DROP DATABASE $Database" -Method Post
}