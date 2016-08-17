class CreateTeamPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :team_points do |t|
      t.integer :team_id
      t.integer :value
      t.string :user
      t.timestamps null: false
    end
  end
end
