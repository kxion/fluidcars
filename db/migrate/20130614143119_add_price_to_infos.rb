class AddPriceToInfos < ActiveRecord::Migration
  def change
    add_column :infos, :price, :integer
    add_column :infos, :user_id, :integer
  end
end
