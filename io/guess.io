num := Random value(100) ceil
guess := nil
lastGuess := nil
guessNum := 0
promptTxt := "Choose a number between 0-100:"

promptGuess := method(
    hotCold := ""
    if(guess != nil,
        if(lastGuess != nil,
            if((num - guess) abs < (num - lastGuess) abs,
                hotCold = "Warmer. ", hotCold = "Colder. "
            ),
            hotCold = "Nope, try again. "
        )
        lastGuess = guess
    )
    File standardOutput writeln(hotCold .. promptTxt)
    guess = File standardInput readLine asNumber
    guessNum = guessNum + 1
)

while(guess != num and guessNum < 10, promptGuess())

if(guess == num,
    File standardOutput writeln("Correct!"),
    File standardOutput writeln("Nope, it was #{num} you loose. Play again." interpolate)
)
