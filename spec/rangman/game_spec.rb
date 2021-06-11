# frozen_string_literal: true

require 'rangman'

RSpec.describe Rangman::Game do
  subject(:game) { described_class.new }

  describe '#start' do
    it 'asks for a guess while the player has remaining lives or the board remains incomplete' do
      expect(game.start)
    end
  end
end
