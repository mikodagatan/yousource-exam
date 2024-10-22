module Sort
  class Service < BaseService
      STRATEGIES = {
      bubble_sort: Sort::Strategies::BubbleSortStrategy,
      quick_sort: Sort::Strategies::QuickSortStrategy,
      merge_sort: Sort::Strategies::MergeSortStrategy
    }.freeze

    STRATEGIES_OPTIONS = STRATEGIES.keys.map do |key|
      [ key.to_s.humanize.capitalize, key.to_s ]
    end.freeze

    attr_reader :data, :strategy, :errors, :result

    def initialize(data: nil, strategy: :bubble_sort)
      @data = data
      @strategy = strategy.to_sym
      @errors = {}
    end

    def call
      return false unless valid?

      result = strategy_class.call(formatted_data)
      @result = format_result(result)
      true
    end

    private

    def valid?
      validator = Sort::Validator.new(data:, strategy:)
      return true if validator.valid?

      @errors = validator.errors
      false
    end

    def strategy_class
      STRATEGIES[strategy]
    end

    def formatted_data
      data.chars
    end

    def format_result(array)
      array.join
    end
  end
end
