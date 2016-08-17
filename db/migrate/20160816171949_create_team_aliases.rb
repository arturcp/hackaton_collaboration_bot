class CreateTeamAliases < ActiveRecord::Migration[5.0]
  def change
    create_table :team_aliases do |t|
      t.integer :team_id
      t.string :alias
    end

    add_foreign_key :team_aliases, :teams
  end
end
