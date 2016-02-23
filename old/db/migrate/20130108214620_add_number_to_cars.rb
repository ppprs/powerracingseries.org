class AddNumberToCars < ActiveRecord::Migration
  def change
    add_column :cars, :number, :integer
  end
end
