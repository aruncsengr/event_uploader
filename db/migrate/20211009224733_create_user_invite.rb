class CreateUserInvite < ActiveRecord::Migration[6.1]
  def change
    create_table :user_invites, id: false do |t|
      t.string :username, index: true, null: false
      t.string :rsvp
      t.tstzrange :timeslot, null: false
      t.integer :event_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
