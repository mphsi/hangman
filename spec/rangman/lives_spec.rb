# frozen_string_literal: true

require 'rangman'

RSpec.describe Rangman::Lives do
  subject(:lives) { described_class.new }

  describe '#state' do
    let(:remaining_lives) { described_class::DEFAULT_LIVES.to_s }

    it 'returns a String including the number of remaining lives' do
      expect(lives.state).to include(remaining_lives)
    end

    context 'when the number of lives decreases' do
      before { lives.decrease }

      let(:remaining_lives) { (described_class::DEFAULT_LIVES - 1).to_s }

      it 'includes the updated number of remaining lives' do
        expect(lives.state).to include(remaining_lives)
      end
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
    it 'decreases the number of lives by 1' do
      expect { lives.decrease }.to change { lives.lives }
    end
  end
end
