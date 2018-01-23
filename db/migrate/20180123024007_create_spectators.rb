class CreateSpectators < ActiveRecord::Migration[5.1]
  def change
    create_table :spectators do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :adress
      t.integer :zip_code
      t.string :country
      t.integer :age
      t.integer :sexe

      t.timestamps
    end
  end
end
