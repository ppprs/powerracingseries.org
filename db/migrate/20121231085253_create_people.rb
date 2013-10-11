class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :twitter
      t.string :email
      t.string :address
      t.date   :birthday
      t.text :bio
      t.string :photo_url
      t.string :personal_url
      t.string :location
      t.integer :team_id
      t.boolean :is_admin

      t.timestamps
    end
  end
end
