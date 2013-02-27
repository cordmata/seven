module Main where

    allEven :: [Integer] -> [Integer]
    allEven [] = []
    allEven (h:t) = if even h then h:allEven t else allEven t

    allEven' lst = [l | l <- lst, even l]

    allEven'' lst = filter even lst

