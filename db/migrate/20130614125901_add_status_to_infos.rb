class AddStatusToInfos < ActiveRecord::Migration
  def change
    add_column :infos, :status, :string, default: 'active'
  end
end
