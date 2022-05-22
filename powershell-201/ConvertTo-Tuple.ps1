function ConvertTo-Tuple {
    <#
        .SYNOPSIS
        A tuple is an immutable sequence type. ConvertTo-Tuple is a helper function to convert create a single item tuple.
    #>
    param(
        $target
    )

    if ($target.GetType().Name -match 'object\[\]|Hashtable|int|double') {
        return [System.Tuple]::Create($target)
    }
    elseif ($target -is [string]) {
        return [System.Tuple]::Create($target.ToCharArray())
    } 
}