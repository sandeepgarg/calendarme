class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.text :location
      t.string :time_zone
      t.datetime :start_time
      t.datetime :end_time
      t.integer :status, limit: 2
      t.integer :event_types, limit: 2
      t.integer :invitees_count
      t.timestamps
    end
  end
end
