class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :avatar, :string, default: '', null: false
      t.timestamps null: false
    end
  end
end
