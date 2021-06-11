# frozen_string_literal: true

require 'rangman'

RSpec.describe Rangman::Words do
  subject(:words) { described_class }

  describe '.sample' do
    it 'returns one of the words included in SUPPORTED_WORDS' do
      expect(described_class::SUPPORTED_WORDS).to include(words.sample)
    end
  end
end
