<# 
Functions in PowerShell are values.

Having functions as values allows us to do some clever things, 
such as build a primitive calculator using functions as values in a hash table. Let’s see how this works.
#>

function add ($a, $b) { $a + $b }
function sub ($a, $b) { $a - $b }
function mul ($a, $b) { $a * $b }
function div ($a, $b) { $a / $b }

$opMap = @{
    '+' = 'add'
    '-' = 'sub'
    '*' = 'mul'
    '/' = 'div'
}

$expressions = $(
    , @("2", "+", "3")
    , @("2", "-", "3")
    , @("2", "*", "3")
    , @("2", "/", "3")
    , @("2", "%", "3")
    , @("two", "+", "three")
    , @("5")
)

foreach ($e in $expressions) {
    $op = $e[1]
    if ($null -ne $op) {
        $opFunc = $opMap[$op]
        if ($null -ne $opFunc) {
            $exp = "$opFunc $($e[0]) $($e[2])"
            "{0} = {1}" -f ($e -join ' '), ($exp | Invoke-Expression)
        }
        else {
            Write-Warning "unsupported operator $op"
        }
    }
    else {
        Write-Warning "invalid expression [$($e)]"
    }
}