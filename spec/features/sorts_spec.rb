require 'rails_helper'

RSpec.describe 'Sorts', type: :feature do
  describe 'sorting' do

    context 'when data is valid' do
      let(:data) { 'cba'}
      it 'sorts in ascending order' do
        visit root_path
        fill_in 'Data', with: data
        click_button 'Sort'
  
        expect(page).to have_content('abc')
      end
    end
    
    context 'when data is invalid' do
      let(:data) { '123' }
      it 'shows an error message' do
        visit root_path
        fill_in 'Data', with: data
        click_button 'Sort'

        expect(page).to have_content('Data only allows small case letters')
      end
    end
  end
end
