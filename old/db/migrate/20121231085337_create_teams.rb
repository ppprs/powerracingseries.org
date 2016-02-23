class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :url
      t.string :photo_url
      t.string :video_url
      t.string :location
      t.string :organization_name
      t.timestamps
    end
  end
end
