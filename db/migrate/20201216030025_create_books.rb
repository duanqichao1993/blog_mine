class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :isbn_number
      t.string :author

      t.timestamps
    end
  end
end
