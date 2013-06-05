class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.date :rent_start
      t.date :rent_end
      t.text :description
      t.string :location
      t.integer :price
      t.string :avatar
      t.timestamps
    end
  end
end
