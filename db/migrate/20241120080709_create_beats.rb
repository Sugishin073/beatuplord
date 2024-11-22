class CreateBeats < ActiveRecord::Migration[7.0]
  def change
    create_table :beats do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.integer    :genre_id, null: false
      t.integer    :vibes_id , null: false
      t.timestamps
    end
  end
end
