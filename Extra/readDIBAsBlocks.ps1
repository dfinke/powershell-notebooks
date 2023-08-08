param(
    [parameter(ValueFromPipelineByPropertyName)]    
    $FullName
)

Process {
    $data = Get-Content $FullName

    $sheBangs = Get-ChildItem $FullName | Select-String '#!' 

    $targetCount = $sheBangs.count

    $blockCount = 0
    for ($i = 0; $i -lt $targetCount; $i++) {

        $start = $sheBangs[$i].LineNumber - 1
        $end = $data.Count - 1
        if ($i + 1 -lt $targetCount) {
            $end = $sheBangs[$i + 1].LineNumber - 2
        }

        [pscustomobject][ordered]@{
            Block    = $blockCount++
            Type     = $data[$start].Replace('#!', '')
            Content  = $data[$start..$end] -join "`n"
            Fullname = $FullName
        }
    }
}