#!/usr/bin/python3
# -*- coding: utf-8 -*-

# Importing the time module
import time

# Welcoming the user
name = input("What's your name? >>")

print("Hello, " + name + ", time to play hangman! ✊")

# Adding some ASCII art!
HANGMANPICS = ['''



   +---+

   |   |

       |

       |

       |

       |

 =========''', '''



   +---+

   |   |

   O   |

       |

       |

       |

 =========''', '''



   +---+

   |   |

   O   |

   |   |

       |

       |

 =========''', '''



   +---+

   |   |

   O   |

  /|   |

       |

       |

 =========''', '''



   +---+

   |   |

   O   |

  /|\  |

       |

       |

 =========''', '''



   +---+

   |   |

   O   |

  /|\  |

  /    |

       |

 =========''', '''



   +---+

   |   |

   O   |

  /|\  |

  / \  |

       |

 =========''']
# Here we set the target word
word = "secret"

# Turn limit
turns = 10
current_word = "-" * len(word)
fail_limit = 6
fails = 0

while turns > 0:
    turns -= 1
    print(HANGMANPICS[fails - fail_limit - 1] + '\n')
    print(current_word)
    guess = input("Type a character: ")

    # Find the characters in the target string and count them
    if (word.count(guess) >= 1):
        char_index_arr = [pos for pos, char in enumerate(word) if char == guess]
        # This is how you split a string into a letter array
        current_arr = list(current_word)
        # print(current_arr)
        # Add the correct guesses to the displayed string
        for index in char_index_arr:
            current_arr[index] = guess
        current_word = ''.join(current_arr)

    else:
        fails += 1
        print("Whoops, that letter isn't in the word! You got " + str(fail_limit - fails) + " more tries.")

    if (current_word == word):
        print("Congratulations, you found the secret word in " + str(turns) + " turns!")
        break

    if (fails == fail_limit):
        print("Aww, you don't have any more tries. Sorry, you lose.")
        break

print("Game is over.")
