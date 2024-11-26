class CreateAppointments < ActiveRecord::Migration[7.2]
  def change
    create_table :appointments do |t|
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end
end
