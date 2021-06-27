# Rangman

A CLI [Hangman game](https://en.wikipedia.org/wiki/Hangman_(game)) made with Ruby.

## Installation

---

If you are using a Ruby manager (Rbenv, RVM, etc.) run:
```sh
gem install rangman
```

If you are using a system-wide Ruby you may need to:
```sh
sudo gem install rangman
```

## Playing the game

---

From your terminal run:

```sh
rangman --word jazz
```

### Game options
- --lives [1-10] for defining the number of lives. 7 by default.
- --render-guesses [true, false] Whether to render all previous guesses or not. Yes by default.

### Requirements

- A Ruby version installed in your machine is required.

You can validate if you have Ruby installed by running from a terminal:
```
  ruby -v
```

## Development

---

### Runing the tests

Install the dependencies with 'bundle install'. Then, from your terminal, run:
```
  bundle exec rspec
```
### Planned features

Missing features:

- [ ] Gracefully handle non-alphabet characters
- [ ] A scoreboard
- [ ] Play Again feature
- [ ] Draw the Hangman
- [ ] Provide a dictionary from which to take a random word.
