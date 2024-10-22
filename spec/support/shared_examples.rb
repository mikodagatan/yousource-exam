RSpec.shared_examples "sorts in ascending order" do
  subject(:service) { described_class.new(array) }
  
  describe '#call' do
    context 'when array is alphabetical' do
      let(:array) { ['c', 'b', 'a'] }
      it 'returns sorted array' do
        expect(service.call).to eq(['a', 'b', 'c'])
      end
    end

    context 'when array is numerical' do
      let(:array) { [3, 2, 1] }

      it 'returns sorted array' do
        expect(service.call).to eq([1, 2, 3])
      end
    end

    # Mixed case strings
    context 'when array contains mixed case strings' do
      let(:array) { ['b', 'A', 'C'] }

      it 'returns sorted array with case priority' do
        expect(service.call).to eq(['A', 'C', 'b'])
      end
    end

    context 'when array is empty' do
      let(:array) { [] }
      it 'returns empty array' do
        expect(service.call).to eq([])
      end
    end

    context 'when array has duplicate values' do
      let(:array) { [3, 1, 2, 2, 1] }
      it 'returns sorted array with duplicates preserved' do
        expect(service.call).to eq([1, 1, 2, 2, 3])
      end
    end

    context 'when array contains special characters' do
      let(:array) { ['!', '@', '#', '$'] }
      it 'returns sorted array' do
        expect(service.call).to eq(['!', '#', '$', '@'])
      end
    end

    context 'when array contains negative numbers' do
      let(:array) { [-1, -3, -2] }
      it 'returns sorted array' do
        expect(service.call).to eq([-3, -2, -1])
      end
    end

    context 'when array contains numbers and strings' do
      let(:array) { [1, 'a', 2, 'b'] }
      it 'raises an error' do
        expect { service.call }.to raise_error(ArgumentError)
      end
    end
  end
end
