module Sort
  module Strategies
    class QuickSortStrategy < BaseStrategy
      def call
        return array if array.length <= 1

        pivot = array[array.length / 2]
        left = array.select { |x| x < pivot }
        middle = array.select { |x| x == pivot }
        right = array.select { |x| x > pivot }

        sort(left) + middle + sort(right)
      end
    end
  end
end
