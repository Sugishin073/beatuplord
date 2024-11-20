class CreateBeats < ActiveRecord::Migration[7.0]
  def change
    create_table :beats do |t|
      t.string :title

      t.timestamps
    end
  end
end
