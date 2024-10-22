require 'rails_helper'

RSpec.describe 'Sorts', type: :request do
  describe 'GET /' do
    it 'returns a successful response' do
      get root_path

      expect(response.status).to eq(200)
    end
  end

  describe 'POST /sorts' do
    let(:params) { { data: 'cba', strategy: 'bubble_sort' } }

    context 'with valid params' do

      it 'returns a successful response' do
        post sorts_path, params: params, headers: { 'Accept' => 'text/vnd.turbo-stream.html' }

        expect(response.status).to eq(200)
        expect(response.body).to include('abc')
      end
    end

    context 'with invalid params' do
      let(:params) { { data: '123', strategy: 'bubble_sort'} }

      it 'returns errors' do
        post sorts_path, params: params, headers: { 'Accept' => 'text/vnd.turbo-stream.html' }

        expect(response.status).to eq(200)
        expect(response.body).to include('Data only allows small case letters')
      end
    end
  end
end
