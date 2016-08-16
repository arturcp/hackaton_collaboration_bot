class CreateHouseAliases < ActiveRecord::Migration[5.0]
  def change
    create_table :house_aliases do |t|
      t.integer :house_id
      t.string :alias
    end

    add_foreign_key :house_aliases, :houses
  end
end
