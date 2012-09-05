squareBrackets := method(
    l := list()
    call message arguments foreach(a, l append(doMessage(a)))
)

li := [1, 2, 3, 4]

"#{li sum} == 10" interpolate println
