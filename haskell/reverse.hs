module Main where

    -- recursive
    reverseList :: [a] -> [a]
    reverseList [] = []
    reverseList [a] = [a]
    reverseList l = last l : reverseList (init l)

    -- Hahahaha...yeah.
    reverseList' l = reverse l

