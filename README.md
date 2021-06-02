# Rangman

The Hangman game made with Ruby.

## Game Rules
- The game starts selecting a random word from a list of Game Words
- Starting each round the game will print a '_' for each character in the Game Word you need to guess.
- In each turn you can guess a letter in the word by typing the letter.
- If you give a letter that it's not part in the Game Word you make an incorrect guess. And lose one of your lifes.
- If you give a letter that is part of the Game Word the character you make a correct guess. And the guessed character shown in the position or positions in which it exists in the Game Word.
- You lose the game if you loose all your lifes.
- You win the game if you correctly guess all letters in the Game Word.

### Defaults
- You start the game with 7 lives.

### Game Words
TBD

## Requirements
Ruby `2.3` or above.

You can validate if you have Ruby installed by running from a terminal:
```
  ruby -v
```

## Runing the game

From your terminal, start a IRB session with 'irb -r ./lib/rangman.rb`
```
  # Run a new Game session
  Rangman::Game.new.start
```

## Development

Missing features:

- [ ] Add tests
- [ ] Expand the supported words.
- [ ] Count already guessed letters like an incorrect guess.
- [ ] Add scoreboard
- [ ] Add Play Again functionality
- [ ] Add scoreboard
- [ ] Add Hangman Graphics

### Runing the tests

Install the dependencies with 'bundle install'. Then, from your terminal, run:
```
  bundle exec rspec
```
