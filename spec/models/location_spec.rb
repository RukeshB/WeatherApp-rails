require 'rails_helper'

# run this command to test rspec spec/models/location_spec.rb -f d

RSpec.describe Location, type: :model do
  let(:location) { create(:location) }

  describe 'Valid' do
    it 'all data present' do
      expect(location).to(be_valid)
    end
  end

  describe 'InValid' do
    it 'City not Present' do
      location.city = nil
      expect(location).not_to(be_valid)
    end

    it 'Country not Present' do
      location.country = nil
      expect(location).not_to(be_valid)
    end
  end
end
