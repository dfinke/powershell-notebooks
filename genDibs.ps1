$names = $(
    'Working with CSV'
    'Working with JSON'
    'Working with Classes'
    'Working with REST APIs'
    'TBD'
    'TBD'
    'TBD'
    'TBD'
    'TBD'
    'TBD'
    'TBD'
    'TBD'
    'TBD'
    'TBD'
)

$path = "./powershell-201"
$c = 1
foreach ($item in $names) {    
    $fileName = "{0}/{1}-{2}.dib" -f $path, ($c++).ToString("0#"), $item

    @" 
#!markdown

# $item

#!pwsh
1

"@ | Set-Content $fileName -Encoding UTF8
}

