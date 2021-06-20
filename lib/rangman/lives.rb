# frozen_string_literal: true

module Rangman
  # Game Lives wrapper
  class Lives
    DEFAULT_LIVES = 7

    attr_reader :lives

    def initialize(lives = DEFAULT_LIVES)
      @lives = lives
    end

    def remaining?
      remaining.positive?
    end

    def remaining
      @lives
    end

    def decrease
      @lives -= 1
    end
  end
end
