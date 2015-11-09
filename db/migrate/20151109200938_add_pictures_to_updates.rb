class AddPicturesToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :pictures, :json
  end
end
