class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :description
      t.date :published_date
      t.decimal :price

      t.timestamps
    end
  end
end
