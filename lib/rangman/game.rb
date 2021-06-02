# frozen_string_literal: true

module Rangman
  # Game session handling
  class Game
    attr_reader :lives, :word, :board

    def initialize
      @lives = Lives.new
      @word  = Words.sample
      @board = Board.new(word)
    end

    def start
      puts "Welcome to Rangman!\n\n"

      while lives.remaining? && board.incomplete?
        puts lives.state
        puts board.state

        make_a_guess
      end

      puts board.incomplete? ? 'You loose!' : 'You won!'
    end

    def make_a_guess
      if board.reveal_character(guess)
        # nothing else to do
      else
        lives.decrease
      end
    end

    def guess
      print "\nPlease guess a letter: "
      gets.chomp
    end
  end
end
