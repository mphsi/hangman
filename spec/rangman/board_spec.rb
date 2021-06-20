# frozen_string_literal: true

require 'rangman'

RSpec.describe Rangman::Board do
  subject(:board) { described_class.new(word) }

  let(:word) { 'dog' }
  let(:hidden_letter_char) { described_class::HIDDEN_LETTER_CHAR }

  describe 'initialization' do
    context 'when game word is nil' do
      let(:word) { nil }

      it 'raises an error' do
        expect { board }.to raise_error(Rangman::MissingWordError)
      end
    end
  end

  describe '#word_letters' do
    it 'returns an array with the word letters hidden' do
      word_letters_hidden = word.chars.map { hidden_letter_char }

      expect(board.word_letters).to eq(word_letters_hidden)
    end
  end

  describe '#reveal_letter' do
    context 'when the letter exists in word' do
      it 'returns true' do
        expect(board.reveal_letter('d')).to eq(true)
      end

      it 'reveals the letter in the board' do
        expect { board.reveal_letter('d') }.to change { board.word_letters }.to(%w[d _ _])
      end
    end

    context 'when the letter does not exists in word' do
      it 'returns false' do
        expect(board.reveal_letter('c')).to eq(false)
      end

      it 'does not reveals any letter' do
        expect { board.reveal_letter('c') }.not_to change { board.word_letters }
      end
    end
  end

  describe '#revealed?' do
    context 'when all word letters have been guessed' do
      before do
        %w[d o g].each { |letter| board.reveal_letter(letter) }
      end

      it 'returns true' do
        expect(board.revealed?).to eq(true)
      end
    end

    context 'when at least one letter remains hidden' do
      before do
        %w[d o].each { |letter| board.reveal_letter(letter) }
      end

      it 'returns false' do
        expect(board.revealed?).to eq(false)
      end
    end
  end
end
