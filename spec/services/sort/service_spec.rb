require 'rails_helper'

RSpec.describe Sort::Service, type: :service do
  subject(:service) { described_class.new(data:, strategy:) }
  let(:data) { 'abcdefghijklmnopqrstuvwxyz'.reverse }
  let(:strategy) { :bubble_sort}
  
  describe '#call' do
    context 'when params are valid' do
      it 'returns true' do
        expect(subject.call).to be_truthy
      end
    end

    context 'when params are invalid' do
      let(:data) { '123' }
      it 'returns true' do
        expect(subject.call).to be_falsey
      end
    end
  end

  describe '#result' do
    context 'when params are valid' do
      it 'returns sorted data' do
        subject.call
        expect(subject.result).to eq(data.sort)
      end
    end

    context 'when params are invalid' do
      let(:data) { '123' }
      
      it 'returns nil' do
        subject.call
        expect(subjecdt.result).to be_nil
      end
    end
  end
end
