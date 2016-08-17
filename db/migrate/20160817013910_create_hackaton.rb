class CreateHackaton < ActiveRecord::Migration[5.0]
  def change
    create_table :hackatons do |t|
      t.string :name
      t.string :success_pretext
      t.string :success_text
      t.string :error_color
      t.string :error_pretext
      t.string :error_text
      t.string :error_image_url

      t.timestamps null: false
    end
  end
end
