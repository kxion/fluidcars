class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :face
      t.references :user
      t.timestamps
    end
  end
end
