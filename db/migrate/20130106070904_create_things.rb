class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :name
      t.integer :guy
      t.string :title

      t.timestamps
    end
  end
end
