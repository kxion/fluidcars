class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :day
      t.integer :week
      t.integer :month
      t.references :info

      t.timestamps
    end
  end
end
