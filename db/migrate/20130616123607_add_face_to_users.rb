class AddFaceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :face, :string
  end
end
