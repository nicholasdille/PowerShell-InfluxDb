function Limit-InfluxDbDatabase {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='High')]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Database
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [datetime]
        $Timestamp
    )

    begin {
        if (-not $PSBoundParameters.ContainsKey('Confirm')) {
            $ConfirmPreference = $PSCmdlet.SessionState.PSVariable.GetValue('ConfirmPreference')
        }
        if (-not $PSBoundParameters.ContainsKey('WhatIf')) {
            $WhatIfPreference = $PSCmdlet.SessionState.PSVariable.GetValue('WhatIfPreference')
        }
    }

    process {
        $StringifiedTimestamp = Get-Date -Date $Timestamp -UFormat "%Y-%m-%dT%TZ"
        if ($Force -or $PSCmdlet.ShouldProcess("Limit database '$Database' with timestamp '$StringifiedTimestamp'?")) {
            Invoke-InfluxDbApi -Query "DELETE WHERE time < '$StringifiedTimestamp'" -Method Post -Database $Database
        }
    }
}