function Remove-InfluxDbPrivilege {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='High')]
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
    
    begin {
        if (-not $PSBoundParameters.ContainsKey('Confirm')) {
            $ConfirmPreference = $PSCmdlet.SessionState.PSVariable.GetValue('ConfirmPreference')
        }
        if (-not $PSBoundParameters.ContainsKey('WhatIf')) {
            $WhatIfPreference = $PSCmdlet.SessionState.PSVariable.GetValue('WhatIfPreference')
        }
    }
    
    process {
        if ($Force -or $PSCmdlet.ShouldProcess("ShouldProcess?")) {
            Invoke-InfluxDbApi -Query "REVOKE $Privilege ON $Database FROM $User" -Method Post
        }
    }
}