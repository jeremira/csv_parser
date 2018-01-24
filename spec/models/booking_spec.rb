require 'rails_helper'

RSpec.describe Booking, type: :model do

  let(:booking)         {build :booking}
  let(:another_booking) {build :booking}

  it 'has a valid factory' do
    expect(booking).to be_valid
  end


end
