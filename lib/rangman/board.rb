# frozen_string_literal: true

module Rangman
  # Game Board wrapper. It requires a Game Word to already be defined
  class Board
    UNGUESSED_CHAR = '_'

    def initialize(word)
      @word  = word
      @board = [UNGUESSED_CHAR] * word.size
    end

    def state
      @board.join(' ')
    end

    def incomplete?
      @board.include?(UNGUESSED_CHAR)
    end

    # Returns a Boolean to let know caller if argument was a correct guess
    def reveal_character(guess)
      guess_included = false

      @word.chars.each_with_index do |character, index|
        if guess.downcase == character.downcase
          @board[index]  = character
          guess_included = true
        end
      end

      guess_included
    end
  end
end
