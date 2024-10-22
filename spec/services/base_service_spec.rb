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
    it 'allows args on call' do
      result = TestService.call(5)
      expect(result).to eq(10)
    end
  end

  describe TestServiceWithKwargs do
    it 'allows kwargs on call' do
      result = TestServiceWithKwargs.call(value: 5, multiplier: 3)
      expect(result).to eq(15)
    end
  end
end
