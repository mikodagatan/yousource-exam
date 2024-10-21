require 'rails_helper'

RSpec.describe BaseService do
  class TestService < BaseService
    def initialize(value)
      @value = value
    end

    def call
      @value * 2
    end
  end

  class TestServiceWithKwargs < BaseService
    def initialize(value:, multiplier:)
      @value = value
      @multiplier = multiplier
    end

    def call
      @value * @multiplier
    end
  end

  describe TestService do
    it 'doubles the value' do
      result = TestService.call(5)
      expect(result).to eq(10)
    end

    it 'returns zero when value is zero' do
      result = TestService.call(0)
      expect(result).to eq(0)
    end

    it 'handles negative values' do
      result = TestService.call(-3)
      expect(result).to eq(-6)
    end
  end

  describe TestServiceWithKwargs do
    it 'multiplies the value by the multiplier' do
      result = TestServiceWithKwargs.call(value: 5, multiplier: 3)
      expect(result).to eq(15)
    end

    it 'returns zero when value is zero' do
      result = TestServiceWithKwargs.call(value: 0, multiplier: 3)
      expect(result).to eq(0)
    end

    it 'returns zero when multiplier is zero' do
      result = TestServiceWithKwargs.call(value: 5, multiplier: 0)
      expect(result).to eq(0)
    end

    it 'handles negative values' do
      result = TestServiceWithKwargs.call(value: -4, multiplier: 2)
      expect(result).to eq(-8)
    end

    it 'handles negative multipliers' do
      result = TestServiceWithKwargs.call(value: 4, multiplier: -2)
      expect(result).to eq(-8)
    end
  end
end
