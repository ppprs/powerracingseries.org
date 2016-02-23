class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.text :description
      t.string :photo_url
      t.integer :team_id

      t.timestamps
    end
  end
end
