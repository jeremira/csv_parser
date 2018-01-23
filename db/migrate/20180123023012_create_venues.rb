class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.integer :key
      t.datetime :start_time
      t.datetime :end_time
      t.references :spectacle, foreign_key: true

      t.timestamps
    end
  end
end
