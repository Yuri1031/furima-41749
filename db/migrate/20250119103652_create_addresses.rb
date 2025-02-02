class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :postcode , null: false
      t.string :area , null: false
      t.string :num_of_address, null: false
      t.string :building 
      t.string :phone_num, null: false
      t.integer :prefecture_id, null: false
      
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
