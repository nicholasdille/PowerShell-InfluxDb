#requires -Modules Helpers

function New-InfluxDbUser {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
        "PSAvoidUsingPlainTextForPassword", 
        "", 
        Justification = ""
    )]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
        "PSAvoidUsingUserNameAndPassWordParams", 
        "", 
        Justification = ""
    )]
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Low')]
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
            Invoke-InfluxDbApi -Query "CREATE USER $User WITH PASSWORD '$Password'" -Method Post
        }
    }
}