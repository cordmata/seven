"--------Looping--------------" println

fib := method(n,
    current := 0
    next := 1
    for(i, 1, n,
        tmp := current
        current = current + next
        next = tmp
    )
    return current
)

for(i, 0, 9, fib(i) println)

"--------Recursive--------------" println

fibr := method(n,
    if(n == 0, return 0)
    if(n == 1, return 1)
    fibr(n -1) + fibr(n-2)
)

for(i, 0, 9, fibr(i) println)
