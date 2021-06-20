# frozen_string_literal: true

require 'rangman'

RSpec.describe Rangman::Lives do
  subject(:lives) { described_class.new(starting_lives) }

  let(:starting_lives) { 6 }

  describe 'initialization' do
    context 'when lives is outside of the min and max range' do
      let(:starting_lives) { 8 }

      it 'raises and error' do
        expect { lives }.to raise_error(Rangman::InvalidLivesError)
      end
    end
  end

  describe '#remaining' do
    it 'returns an int for the number of remaining lives' do
      expect(lives.remaining).to eq(starting_lives)
    end
  end

  describe '#remaining?' do
    context 'when the number of lives is greater than 0' do
      it 'returns true' do
        expect(lives.remaining?).to eq(true)
      end
    end

    context 'when the number of lives is equals or less than 0' do
      before { 10.times { lives.decrease } }

      it 'returns false' do
        expect(lives.remaining?).to eq(false)
      end
    end
  end

  describe '#decrease' do
    it 'decreases the number of remaining lives by 1' do
      expect { lives.decrease }.to change { lives.remaining }.by(-1)
    end
  end
end
