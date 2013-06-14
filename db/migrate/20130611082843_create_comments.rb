class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :car
      t.text :content

      t.timestamps
    end
  end
end
