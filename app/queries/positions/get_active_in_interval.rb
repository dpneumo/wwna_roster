# frozen_string_literal: true

module Positions
  class GetActiveInInterval < ApplicationQuery
    def initialize(int_start, int_stop)
      @int_start = int_start
      @int_stop = int_stop
      super()
    end

    def call
      Position.where('(start, stop) OVERLAPS (?, ?)', @int_start, @int_stop)
    end
  end
end
