# frozen_string_literal: true

module Rangman
  # Game Board wrapper. It requires a Game Word to already be defined
  class Board
    HIDDEN_LETTER_CHAR = '_'

    attr_reader :word_letters

    def initialize(word = nil)
      @word = word || select_randomized_word
      @word_letters = hidden_word_letters
    end

    def reveal_letter(letter)
      letter_included = false

      @word.chars.each_with_index do |character, index|
        if letter.downcase == character.downcase
          word_letters[index] = character
          letter_included = true
        end
      end

      letter_included
    end

    def revealed?
      !word_letters.include?(HIDDEN_LETTER_CHAR)
    end

    private

    def select_randomized_word
      Words.sample
    end

    def hidden_word_letters
      [HIDDEN_LETTER_CHAR] * @word.size
    end
  end
end
