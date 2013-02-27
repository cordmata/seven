module Main where

    colors = ["black", "white", "blue", "yellow", "red"]
    colorCombos = [(a,b) | a <- colors, b <- colors, a < b]
