# frozen_string_literal: true

module Rangman
  # Game session handling
  class Game
    attr_reader :lives, :board

    def initialize(input = $stdin, output = $stdout, game_word = nil)
      @input  = input
      @output = output

      @lives  = Lives.new
      @board  = Board.new(game_word)
    end

    def start
      output_game_start

      while lives.remaining? && !board.revealed?
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
      @output.puts "You have #{lives.remaining} remaining lives."
    end

    def output_board_state
      @output.puts "Guess this word: #{board.word_letters.join(' ')}"
    end

    def input_and_process_guess
      guess = player_guess

      lives.decrease unless board.reveal_letter(guess)

      guess
    end

    def player_guess
      @output.puts "\nPlease guess a letter: "
      @input.gets.chomp
    end

    def output_game_result
      @output.puts board.revealed? ? 'You won!' : 'You loose!'
    end
  end
end
