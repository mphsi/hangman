# frozen_string_literal: true

module Rangman
  # Game Lives wrapper
  class Lives
    MIN_LIVES = 1
    MAX_LIVES = 7

    attr_reader :lives

    def initialize(lives)
      raise Rangman::InvalidLivesError unless lives_within_range?(lives)

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

    private

    def lives_within_range?(lives)
      (MIN_LIVES..MAX_LIVES).include? lives
    end
  end
end
