unordered := list(9,3,6,4,0,8,2,5,7,1,10)

gnome := method(toSort,
    pos := 1
    while(pos < toSort size, pos = swapIfNeeded(pos, toSort))
    toSort
)

swapIfNeeded := method(pos, toSort,
    if(toSort at(pos) >= toSort at(pos - 1),
        pos + 1,
        toSort swapIndices(pos, pos - 1)
        if(pos > 1, pos - 1, pos + 1)))

sorted := gnome(unordered)
sorted println
test := if(sorted == list(0,1,2,3,4,5,6,7,8,9,10), "Success", "Borked")
test println
