class ChangePictureToPicturesInUpdates < ActiveRecord::Migration
  def change
    remove_column :updates, :pictures
    add_column :updates, :picture, :string
  end
end
