# frozen_string_literal: true

require 'rangman'

RSpec.describe Rangman::Game do
  subject(:game) { described_class.new(game_input, game_output) }

  let(:game_input) { StringIO.new(format_guesses(player_guesses)) }
  let(:game_output) { StringIO.new }
  let(:player_guesses) { %w[d o g] }

  let(:game_word) { 'dog' }

  describe '#start' do
    before do
      allow(Rangman::Words).to receive(:sample).and_return(game_word)
    end

    it 'outputs the game word' do
      hidden_game_word = game_word.chars.map { '_' }

      game.start

      expect(game_output.string).to include("Guess this word: #{hidden_game_word.join(' ')}")
    end

    it 'asks the player for a guess' do
      allow(game_input).to receive(:gets).and_return("x\n")

      game.start

      expect(game_output.string).to include('Please guess a letter: ')
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
