class CreateCounselors < ActiveRecord::Migration[7.2]
  def change
    create_table :counselors do |t|
      t.string :first_name
      t.string :last_name
      t.string :specialization
      t.string :email
      t.string :phone
      

      t.timestamps
    end
  end
end
