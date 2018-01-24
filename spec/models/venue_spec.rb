require 'rails_helper'

RSpec.describe Venue, type: :model do

  let(:venue) {build :venue}
  let(:another_venue) {build :venue}

  it 'has a valid factory' do
    expect(venue).to be_valid
  end

  it 'do not save twice the same venue' do
    venue.save
    another_venue.key = venue.key
    expect(another_venue).to_not be_valid
  end

end
