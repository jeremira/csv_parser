class BookingDataController < ApplicationController

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

  end

end
