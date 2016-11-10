class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :loc
      t.string :city
      t.string :state
      t.integer :zip
      t.belongs_to :location 

      t.timestamps
    end
  end
end
