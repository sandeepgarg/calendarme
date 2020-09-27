class CreateInvitees < ActiveRecord::Migration[5.2]
  def change
    create_table :invitees do |t|
      t.string :name
      t.string :email
      t.integer :status, limit: 2
      t.integer :event_id, index: true
      t.timestamp
    end
  end
end
