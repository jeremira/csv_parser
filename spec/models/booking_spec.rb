require 'rails_helper'

RSpec.describe Booking, type: :model do

  let(:booking)         {build :booking}
  let(:another_booking) {build :booking}

  it 'has a valid factory' do
    expect(booking).to be_valid
  end
  it 'has an unique ticket number' do
    booking.save
    another_booking.ticket_number = booking.ticket_number
    expect(another_booking).to_not be_valid
  end
  it 'has an unique booking number' do
    booking.save
    another_booking.booking_number = booking.booking_number
    expect(another_booking).to_not be_valid
  end
  
end
