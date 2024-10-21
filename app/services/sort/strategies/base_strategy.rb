module Sort
  module Strategies
    class BaseStrategy < BaseService
      attr_reader :array

      def initialize(array)
        @array = array
      end
    end
  end
end
