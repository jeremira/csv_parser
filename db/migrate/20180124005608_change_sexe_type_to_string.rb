class ChangeSexeTypeToString < ActiveRecord::Migration[5.1]
  def change
   change_column :spectators, :sexe, :string
  end
end
