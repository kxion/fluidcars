class AddCityToInfos < ActiveRecord::Migration
  def change
    add_column :infos, :city, :string
  end
end
