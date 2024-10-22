module Sort
  module Strategies
    class MergeSortStrategy < BaseStrategy
      def call
        return array if array.length <= 1

        mid = array.length / 2
        left_half = self.class.call(array[0...mid])
        right_half = self.class.call(array[mid...array.length])

        merge(left_half, right_half)
      end

      def merge(left, right)
        sorted = []
        i = j = 0

        while i < left.length && j < right.length
          if left[i] <= right[j]
            sorted << left[i]
            i += 1
          else
            sorted << right[j]
            j += 1
          end
        end

        sorted.concat(left[i..-1]) if i < left.length
        sorted.concat(right[j..-1]) if j < right.length

        sorted
      end
    end
  end
end
