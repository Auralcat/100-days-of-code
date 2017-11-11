#!/usr/bin/env ruby

# Making a Ruby version of the guessing game.

# Using a seeded RNG
target = (Random.new).rand(1..1000)
right_guess = false
count = 0

while (!right_guess)
  count += 1
  puts "Guess the number:"
  guess = gets.chomp
  puts "Your guess is lower than the target number." if (guess.to_i < target)
  puts "Hmm... your guess is higher." if (guess.to_i > target)
  if (guess.to_i == target)
    right_guess = true
    puts "Congratulations! Your guess is correct!"
  end
end

puts "Total number of guesses: #{count}"
