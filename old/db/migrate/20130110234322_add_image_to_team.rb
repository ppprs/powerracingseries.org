class AddImageToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :image, :string
  end
end
