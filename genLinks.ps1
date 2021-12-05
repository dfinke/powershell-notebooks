$b = 'vscode://ms-dotnettools.dotnet-interactive-vscode/openNotebook?url=https://raw.githubusercontent.com/dfinke/powershell-notebooks/master/powershell-101/'

Get-ChildItem powershell-101 *.dib -name | ForEach-Object {
    $escaped = [uri]::EscapeDataString($_)
    $alias = $_ -replace '.dib', '' -replace ' ', ''
    [PSCustomObject]@{
        Full    = "$b/$escaped"
        Alias   = $alias
        TinyUrl = "https://tinyurl.com/$alias"
        Escaped = $escaped
    }
} | Format-List | code -