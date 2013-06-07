class AddIndexToInfos < ActiveRecord::Migration
  def change
    add_index :infos, :location
  end
end
