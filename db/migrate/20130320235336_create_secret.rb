class CreateSecret < ActiveRecord::Migration
  def up
    create_table :secrets do |t|
      t.text :title
      t.text :body
      t.text :key
      t.datetime :go_live
      t.datetime :expiration

      t.timestamps
    end
  end

  def down
    drop_table :secrets
  end
end
