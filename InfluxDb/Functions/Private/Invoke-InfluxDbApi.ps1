#requires -Version 4
#requires -Modules Helper

function Invoke-InfluxDbApi {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Query
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [Microsoft.PowerShell.Commands.WebRequestMethod]
        $Method = 'Get'
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $Database
    )

    $InfluxDb = Get-InfluxDbServer

    $Url = "$($InfluxDb.Server)/query?pretty=true"
    $Url += "&q=$Query"
    if ($Database) {
        $Url += "&db=$Database"
    }

    $ConfiguredProtocols = [System.Net.ServicePointManager]::SecurityProtocol
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]'Tls11,Tls12'

    $Response = Invoke-AuthenticatedWebRequest -Uri $Url -Method $Method -User $InfluxDb.User -Token $InfluxDb.Token
    $Content = $Response.Content | ConvertFrom-Json
    
    [System.Net.ServicePointManager]::SecurityProtocol = $ConfiguredProtocols

    foreach ($Result in $Content.results.series) {
        $Name = $Result.name
        $Columns = $Result.columns
        $Values  = $Result.values
        for ($RowIndex = 0; $RowIndex -lt $Values.Length; ++$RowIndex) {
            $Row = @{}
            if ($Name.Length -gt 0 -and -not $Row.ContainsKey('series_name')) {
                $Row.Add('series_name', $Name)
            }
            for ($ColumnIndex = 0; $ColumnIndex -lt $Columns.Length; ++$ColumnIndex) {
                $Row.Add($Columns[$ColumnIndex], $Values[$RowIndex][$ColumnIndex])
            }
            [pscustomobject]$Row
        }
    }
}