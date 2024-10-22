require 'rails_helper'

RSpec.describe FormHelper, type: :helper do
  describe '#form_error' do
    context 'when there is an error' do
      let(:errors) { ActiveModel::Errors.new(nil) }

      before do
        errors.add(:name, 'is invalid')
      end

      it 'returns a div with an error message' do
        expect(helper.form_error(errors, :name)).to have_content('Name is invalid')
      end
    end
  end

  describe '#form_error_classes' do
    let(:classes) do
      %w[
        bg-red-500
        text-white
        rounded-md
        shadow-lg
        px-4
        py-2
        border
        border-red-600
      ]
    end

    it 'returns an array of classes' do
      expect(helper.form_error_classes).to eq(classes)
    end
  end
end
