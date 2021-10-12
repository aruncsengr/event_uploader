class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.timestamp :start_time, null: false
      t.timestamp :end_time, null: false
      t.text :description, null: false
      t.text :users_with_rsvp_raw
      t.boolean :all_day, null: false, default: false
      t.boolean :completed, null: false, default: false

      t.timestamps
    end
  end
end
