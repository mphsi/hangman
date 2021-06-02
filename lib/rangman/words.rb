# frozen_string_literal: true

module Rangman
  # Supported Game words wrapper
  class Words
    SUPPORTED_WORDS = %w[dog cat fast].freeze

    def self.sample
      SUPPORTED_WORDS.sample
    end
  end
end
