class CreateBios < ActiveRecord::Migration
  def change
    create_table :bios do |t|
      t.datetime :birthday
      t.string :city
      t.integer :age
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
