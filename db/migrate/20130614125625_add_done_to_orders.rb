class AddDoneToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :done, :boolean, default: false
  end
end
