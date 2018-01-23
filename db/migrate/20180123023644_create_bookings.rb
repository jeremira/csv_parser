class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :ticket_number
      t.integer :booking_number
      t.datetime :timestamp
      t.integer :price
      t.string :product_type
      t.string :selling_point
      t.references :venue, foreign_key: true

      t.timestamps
    end
  end
end
