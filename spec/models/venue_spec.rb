require 'rails_helper'

RSpec.describe Venue, type: :model do

  let(:venue) {build :venue}
  let(:another_venue) {build :venue}

  it 'has a valid factory' do
    expect(venue).to be_valid
  end
  it 'require a key' do
    venue.key = nil
    expect(venue).to_not be_valid
  end
  it 'has an unique key' do
    venue.save
    another_venue.key = venue.key
    expect(another_venue).to_not be_valid
  end

end
