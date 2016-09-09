class CreateInstructorsInstructors < ActiveRecord::Migration

  def up
    create_table :refinery_instructors do |t|
      t.string :full_name
      t.integer :photo_id
      t.text :full_bio
      t.text :short_bio
      t.integer :position
      t.boolean :active, null: false, default: true

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-instructors"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/instructors/instructors"})
    end

    drop_table :refinery_instructors

  end

end
