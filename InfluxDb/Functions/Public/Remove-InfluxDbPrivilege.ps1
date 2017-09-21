function Remove-InfluxDbPrivilege {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Database
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $User
        ,
        [Parameter()]
        [ValidateSet('All', 'Read', 'Write')]
        [string[]]
        $Privilege = 'All'
    )
    
    Invoke-InfluxDbApi -Query "REVOKE $Privilege ON $Database FROM $User" -Method Post
}