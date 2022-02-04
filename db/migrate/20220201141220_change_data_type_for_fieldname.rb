class ChangeDataTypeForFieldname < ActiveRecord::Migration[7.0]
  def change 
    change_table :foods do |table|
      table.change :measurement_unit, :string
    end
  end
end
