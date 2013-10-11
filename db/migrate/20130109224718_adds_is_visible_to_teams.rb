class AddsIsVisibleToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :is_visible, :boolean, :default => false
  end
end
