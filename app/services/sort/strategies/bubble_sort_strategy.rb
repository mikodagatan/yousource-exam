module Sort
  module Strategies
    class BubbleSortStrategy < BaseStrategy
      def call
        n = array.length
        loop do
          swapped = false
          (n - 1).times do |i|
            if array[i] > array[i + 1]
              array[i], array[i + 1] = array[i + 1], array[i]
              swapped = true
            end
          end
          break unless swapped
        end
        array
      end
    end
  end
end
