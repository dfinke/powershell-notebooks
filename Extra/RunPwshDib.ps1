param(
    [parameter(ValueFromPipelineByPropertyName)]    
    $FullName
)

Process {
    (.\readDIBAsBlocks.ps1 $FullName | Where-Object type -eq 'pwsh').Content | Invoke-Expression
}