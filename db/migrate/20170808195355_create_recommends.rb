class CreateRecommends < ActiveRecord::Migration
  def change
    create_table :recommends do |t|
      t.integer :rating_id
      t.integer :friend_id
      t.integer :entertainment_id

      t.timestamps

    end
  end
end
