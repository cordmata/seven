NUM = rand(10)

def prompt_for_guess
  print 'What is your guess? '
  gets.to_i == NUM
end

puts 'Guess a number between 1 and 10'
guess_correct = false

until guess_correct do
  guess_correct = prompt_for_guess
  puts 'Nope, not it. Try again.' unless guess_correct
end

puts 'You got it right!'
