class ChangeAttendDataTypeToString < ActiveRecord::Migration[5.0]
  
  def up
    change_column :details, :attend, :string
  end

  def down
    change_column :details, :attend, :boolean
  end
    
end
