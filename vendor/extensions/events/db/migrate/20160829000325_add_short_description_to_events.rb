class AddShortDescriptionToEvents < ActiveRecord::Migration
  def change
    add_column :refinery_events, :group, :string
    add_column :refinery_events, :short_description, :string
  end
end
