# frozen_string_literal: true

require 'rangman'

RSpec.describe Rangman::Game do
  subject(:game) { described_class.new(options, game_input, game_output) }

  let(:game_input) { StringIO.new(format_guesses(player_guesses)) }
  let(:game_output) { StringIO.new }
  let(:player_guesses) { %w[d o g] }
  let(:options) do
    {
      word: game_word,
      render_guesses: render_guesses
    }
  end

  let(:game_word) { 'dog' }
  let(:render_guesses) { nil }

  describe 'initialization' do
    context 'when initialization options are not valid' do
      let(:options) { { word: nil, lives: 99, render_guesses: 'a' } }

      it 'raises an error' do
        expect { game }.to raise_error(Rangman::InvalidOptions)
      end
    end
  end

  describe '#start' do
    it 'outputs a welcoming message' do
      game.start

      expect(game_output.string).to include('Welcome to Rangman!')
    end

    describe 'each turn' do
      it 'outputs the number of remaining lifes' do
        game.start

        expect(game_output.string).to include("You have 7 remaining lives.")
      end

      it 'outputs the game word' do
        hidden_game_word = game_word.chars.map { '_' }

        game.start

        expect(game_output.string).to include("Guess this word: #{hidden_game_word.join(' ')}")
      end

      context 'when render_guesses rule is enabled' do
        let(:player_guesses) { %w[m a m m u t h] }

        it 'outputs the player guesses' do
          game.start

          expect(game_output.string).to include('Your guesses are: ["m"]')
          expect(game_output.string).to include('Your guesses are: ["m", "a"]')
          expect(game_output.string).to include('Your guesses are: ["m", "a"]')
          expect(game_output.string).to include('Your guesses are: ["m", "a"]')
          expect(game_output.string).to include('Your guesses are: ["m", "a", "u"]')
          expect(game_output.string).to include('Your guesses are: ["m", "a", "u", "t"]')
        end
      end

      it 'asks the player for a guess' do
        allow(game_input).to receive(:gets).and_return("x\n")

        game.start

        expect(game_output.string).to include('Please guess a letter: ')
      end
    end

    context 'when the player loses all its lives before guessing the word' do
      let(:player_guesses) { %w[f a i l u r e] }

      it 'outputs a failing message' do
        game.start

        expect(game_output.string.lines(chomp: true).last).to eq('You loose!')
      end
    end

    context 'when the player guesses the word' do
      it 'outputs a winning message' do
        game.start

        expect(game_output.string.lines(chomp: true).last).to eq('You won!')
      end
    end
  end
end

def format_guesses(guesses)
  "#{guesses.join("\n")}\n"
end
