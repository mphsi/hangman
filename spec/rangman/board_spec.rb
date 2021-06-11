# frozen_string_literal: true

require 'rangman'

RSpec.describe Rangman::Board do
  subject(:board) { described_class.new(word) }

  let(:word) { 'dog' }

  describe '#state' do
    it 'returns each word letter joined by one space, with unguessed letters covered with "_"' do
      expect(board.state).to eq('_ _ _')
    end

    context 'when a letters have been guessed' do
      before { board.reveal_character('d') }

      it 'reveals the guessed letters' do
        expect(board.state).to eq('d _ _')
      end
    end
  end

  describe '#incomplete?' do
    context 'when all word letters have been guessed' do
      before do
        %w[d o g].each { |letter| board.reveal_character(letter) }
      end

      it 'returns false' do
        expect(board.incomplete?).to eq(false)
      end
    end

    context 'when at least one letter remains to be guessed' do
      before do
        %w[d o].each { |letter| board.reveal_character(letter) }
      end

      it 'returns true' do
        expect(board.incomplete?).to eq(true)
      end
    end
  end

  describe '#reveal_character' do
    context 'when the letter exists in word' do
      it 'returns true' do
        expect(board.reveal_character('d')).to eq(true)
      end

      it 'reveals the letter in the board' do
        expect { board.reveal_character('d') }.to change { board.state }.to('d _ _')
      end
    end

    context 'when the letter does not exists in word' do
      it 'returns false' do
        expect(board.reveal_character('c')).to eq(false)
      end

      it 'does not reveals any letter' do
        expect { board.reveal_character('c') }.not_to change { board.state }
      end
    end
  end
end
