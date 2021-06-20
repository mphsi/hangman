# frozen_string_literal: true

module Rangman
  class InvalidOptions < StandardError; end
  class MissingWordError < StandardError; end
  class InvalidLivesError < StandardError; end
  class InvalidInputError < StandardError; end

  # Game session handling
  class Game
    DEFAULT_LIVES = 7
    RENDER_GUESSES_DEFAULT = true

    attr_reader :lives, :board

    def initialize(options, input = $stdin, output = $stdout)
      @input  = input
      @output = output
      options = merged_with_default_options(options)

      @player_guesses = {}

      initialize_lives!(options)
      initialize_board!(options)
      initialize_rules!(options)
    rescue MissingWordError, InvalidLivesError => e
      raise InvalidOptions, e.message
    end

    def start
      output_game_start

      while lives.remaining? && !board.revealed?
        output_lives_state
        output_board_state
        output_player_guesses if render_guesses?

        process_player_guess(player_guess)
      end

      output_game_result
    end

    private

    def merged_with_default_options(options)
      {
        lives: DEFAULT_LIVES,
        render_guesses: RENDER_GUESSES_DEFAULT,
      }.merge(options) do |_, old_value, new_value|
        if new_value.nil?
          old_value
        else
          new_value
        end
      end
    end

    def initialize_lives!(options)
      @lives = Lives.new(options[:lives])
    end

    def initialize_board!(options)
      @board = Board.new(options[:word])
    end

    def initialize_rules!(options)
      unless [true, false].include? options[:render_guesses]
        raise InvalidOptions, 'render_guesses invalid option. true or false expected'
      end

      @render_guesses = options[:render_guesses]
    end

    def output_game_start
      @output.puts "Welcome to Rangman!\n\n"
    end

    def output_lives_state
      @output.puts "You have #{lives.remaining} remaining lives."
    end

    def output_board_state
      @output.puts "Guess this word: #{board.word_letters.join(' ')}"
    end

    def output_player_guesses
      @output.puts "Your guesses are: #{@player_guesses.keys}"
    end

    def render_guesses?
      @render_guesses
    end

    def process_player_guess(guess)
      letter_revealed = board.reveal_letter(guess)

      decrease_player_lives unless letter_revealed
    end

    def player_guess
      @output.puts "\nPlease guess a letter: "
      guess = @input.gets.chomp

      record_player_guess(guess)

      guess
    rescue StandardError => e
      raise InvalidInputError, e.message
    end

    def decrease_player_lives
      lives.decrease # need to let player know
    end

    def record_player_guess(guess)
      @player_guesses[guess] ||= 0
      @player_guesses[guess] += 1
    end

    def output_game_result
      @output.puts board.revealed? ? 'You won!' : 'You loose!'
    end
  end
end
