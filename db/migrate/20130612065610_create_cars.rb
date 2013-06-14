class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.references :user
      t.string :band
      t.text :description
      t.string :location
      t.integer :price
      t.string :avatar
      t.string :city
      t.timestamps
    end
  end
end
