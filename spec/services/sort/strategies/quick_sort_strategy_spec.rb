require 'rails_helper'

RSpec.describe Sort::Strategies::QuickSortStrategy, type: :service do
  it_behaves_like 'sorts in ascending order'
end
