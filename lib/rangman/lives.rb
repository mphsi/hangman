# frozen_string_literal: true

module Rangman
  # Game Lives wrapper
  class Lives
    DEFAULT_LIVES = 7

    def initialize(lives = DEFAULT_LIVES)
      @lives = lives
    end

    def state
      "You have #{@lives} remaining lives."
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
