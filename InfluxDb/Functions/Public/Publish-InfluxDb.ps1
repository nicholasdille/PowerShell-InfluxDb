function Publish-InfluxDb {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string]
        $InputObject
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Database
    )

    begin {
        $InfluxDb = Get-InfluxDbServer
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]'Tls11,Tls12'
    }

    process {
        $InputObject | ForEach-Object {
            $Response = Microsoft.PowerShell.Utility\Invoke-RestMethod -Uri "$($InfluxDb.Server)/write?db=$Database&u=$($InfluxDb.User)&p=$($InfluxDb.Token)" -Method Post -Body "$_"
        }
    }
}