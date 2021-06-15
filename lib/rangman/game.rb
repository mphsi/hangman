# frozen_string_literal: true

module Rangman
  # Game session handling
  class Game
    attr_reader :lives, :word, :board

    def initialize(input = $stdin, output = $stdout)
      @input  = input
      @output = output

      @lives  = Lives.new
      @word   = Words.sample
      @board  = Board.new(word)
    end

    def start
      output_game_start

      while lives.remaining? && board.incomplete?
        output_lives_state
        output_board_state

        input_and_process_guess
      end

      output_game_result
    end

    private

    def output_game_start
      @output.puts "Welcome to Rangman!\n\n"
    end

    def output_lives_state
      @output.puts lives.state
    end

    def output_board_state
      @output.puts "Guess this word: #{board.state}"
    end

    def input_and_process_guess
      guess = player_guess

      lives.decrease unless board.reveal_character(guess)

      guess
    end

    def player_guess
      @output.puts "\nPlease guess a letter: "
      @input.gets.chomp
    end

    def output_game_result
      @output.puts board.incomplete? ? 'You loose!' : 'You won!'
    end
  end
end
