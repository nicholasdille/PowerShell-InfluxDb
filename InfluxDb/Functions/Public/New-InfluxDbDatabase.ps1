function New-InfluxDbDatabase {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Database
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $ReaderUser
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $ReaderPassword
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $WriterUser
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $WriterPassword
    )
    
    Invoke-InfluxDbApi -Query "CREATE DATABASE $Database" -Method Post

    if ($PSBoundParameters.ContainsKey('ReaderUser') -and $PSBoundParameters.ContainsKey('ReaderPassword')) {
        New-InfluxDbUser -User $ReaderUser -Password $ReaderPassword
        Add-InfluxDbPrivilege -Database $Database -User $ReaderUser -Privilege Read
    }

    if ($PSBoundParameters.ContainsKey('WriterUser') -and $PSBoundParameters.ContainsKey('WriterPassword')) {
        New-InfluxDbUser -User $WriterUser -Password $WriterPassword
        Add-InfluxDbPrivilege -Database $Database -User $WriterUser -Privilege All
    }
}