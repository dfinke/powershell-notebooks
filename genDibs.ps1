$names = $(
    'Working with CSV'
    'Working with JSON'
    'Working with Classes'
    'Working with REST APIs'
)

$c = 1
foreach ($item in $names) {    
    $fileName = "./powershell-201/{0}-{1}.dib" -f ($c++).ToString("0#"), $item

    @" 
#!markdown

# $item

#!pwsh
1

"@ | Set-Content $fileName -Encoding UTF8
}

