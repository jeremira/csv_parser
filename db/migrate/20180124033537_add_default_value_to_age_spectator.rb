class AddDefaultValueToAgeSpectator < ActiveRecord::Migration[5.1]
  def change
    change_column :spectators, :age, :integer, default: 0
  end
end
