class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :friends
      t.string :recommends

      t.timestamps

    end
  end
end
