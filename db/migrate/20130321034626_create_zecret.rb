class CreateZecret < ActiveRecord::Migration
  def up
    create_table :zecrets do |t|
      #t.text :title
      t.text :body

      t.timestamps
    end

    #add_index :zecrets, :title
  end

  def down
    drop_table :zecrets
  end
end
