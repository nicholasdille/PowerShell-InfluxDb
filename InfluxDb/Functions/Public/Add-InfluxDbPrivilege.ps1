function Add-InfluxDbPrivilege {
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
    
    Invoke-InfluxDbApi -Query "GRANT $Privilege ON $Database TO $User" -Method Post
}