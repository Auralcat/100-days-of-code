#!/usr/bin/python3
# -*- coding: utf-8 -*-

# Enhancing a simple "guess the number" game
import random

# Generating the target number as an integer
random.seed()
target = int(random.randint(0, 1000))

got_num_right = False
count = 0

while (not got_num_right):
    count += 1
    guess = int(input("Guess the number: "))
    if (guess == target):
        print("Congratulations! You guess is correct!")
        got_num_right = True
    elif (guess > target):
        print("Hmmm... your guess is higher.")
    else:
        print("Your guess is lower than the target number.")

print("Thanks for playing! The total number of guesses is " + str(count) + ".")
