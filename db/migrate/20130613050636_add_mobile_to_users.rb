class AddMobileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mobile, :number
  end
end
