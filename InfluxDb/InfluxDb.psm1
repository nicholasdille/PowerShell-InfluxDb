Get-ChildItem -Path "$PSScriptRoot\Functions" -Filter '*.ps1' -File -Recurse | ForEach-Object {
    . "$($_.FullName)"
}