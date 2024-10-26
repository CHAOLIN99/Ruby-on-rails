class CreateSessions < ActiveRecord::Migration[7.2]
  def change
    create_table :sessions do |t|
      t.string :title
      t.datetime :session_date
      t.text :session_note
      t.integer :counselor_id

      t.timestamps
    end
  end
end
