class CreateTeamMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :team_members do |t|
      t.integer :team_id
      t.string :name
    end

    add_foreign_key :team_members, :teams
  end
end
