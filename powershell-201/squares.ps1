# function squares {
#     {
#         $script:x++
#         $script:x * $script:x
#     }
# }

$squares = {
    $script:x++
    $script:x * $script:x
}

''
$x = 0
$f = $squares 
&$f # 1
&$f # 4
&$f # 9
&$f # 16