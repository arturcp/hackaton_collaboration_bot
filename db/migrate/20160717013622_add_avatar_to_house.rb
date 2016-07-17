class AddAvatarToHouse < ActiveRecord::Migration[5.0]
  def change
    add_column :houses, :avatar, :string, default: '', null: false
  end
end
