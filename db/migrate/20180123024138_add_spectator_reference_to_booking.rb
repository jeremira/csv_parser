class AddSpectatorReferenceToBooking < ActiveRecord::Migration[5.1]
  def change
     add_reference :bookings, :spectator, index: true
  end
end
