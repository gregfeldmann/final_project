class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :sender_id
      t.datetime :accepted_at

      t.timestamps

    end
  end
end
