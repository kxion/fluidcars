class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.date :rent_start
      t.date :rent_end
      t.references :car
      t.timestamps
    end
  end
end
