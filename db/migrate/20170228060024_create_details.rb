class CreateDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :details do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.boolean :attend
      t.string :batch
      t.string :seat
      t.string :allergy
      t.string :note

      t.timestamps
    end
  end
end
