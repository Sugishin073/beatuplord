class AddUserIdToBeats < ActiveRecord::Migration[7.0]
  def change
    add_column :beats, :user_id, :integer
  end
end
