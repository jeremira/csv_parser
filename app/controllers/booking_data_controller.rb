class BookingDataController < ApplicationController

  include ActionView::Helpers::NumberHelper

  def new
  end

  def create
    csv_file = params[:csv_file]
    if DataParser.parse_file csv_file
      redirect_to booking_data_path, notice: 'File parsed and added to database!'
    else
      redirect_to booking_data_path, alert: 'Oops, didnt parse that...'
    end
  end

  def show
    @total_bookings = Booking.count
    @total_client = Spectator.count
    @total_income = Booking.sum(:price).to_f

    @average_price  = @total_income / (Venue.count.nonzero? || 1)
    @average_price = number_to_currency(@average_price, unit: '€', precision: 2)
    @average_price_by_client = @total_income / (@total_client.nonzero? || 1)
    @average_price_by_client = number_to_currency(@average_price_by_client, unit: '€', precision: 2)
    @average_age = Spectator.where.not(age: 0).average(:age) || 0
    @average_age = @average_age.round

  end

end
