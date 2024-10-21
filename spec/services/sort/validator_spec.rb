require 'rails_helper'

RSpec.describe Sort::Validator, type: :service do
  subject(:service) { described_class.new(data:, strategy:) }
  let(:data) { 'abcdefghijklmnopqrstuvwxyz'.reverse }
  let(:strategy) { :bubble_sort }
  
  describe '#valid?' do
    context 'when params are valid' do
      it 'returns true' do
        expect(service.valid?).to be_truthy
      end
    end

    context 'when data is invalid' do
      let(:data) { '123!@' }

      it 'returns false and add errors' do
        expect(service.valid?).to be_falsey
        expect(service.errors.first.message).to eq('only allows small case letters')
      end
    end

    context 'when strategy is invalid' do
      let(:strategy) { :invalid_strategy }

      it 'returns false and add errors' do
        expect(service.valid?).to be_falsey
        expect(service.errors.first.message).to eq('invalid_strategy is not a valid strategy')
      end
    end
  end
end