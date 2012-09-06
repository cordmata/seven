squareBrackets := method(call message arguments mapInPlace(v, doMessage(v)))

li := [1, 2, 3, 4]

"#{li sum} == 10" interpolate println
