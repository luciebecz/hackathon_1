class CreateDogs < ActiveRecord::Migration[5.0]
  def change
    create_table :dogs do |t|
      t.string :name, null: false
      t.string :breed, null: false
      t.string :gender, null: false
      t.integer :age, null: false
      t.text :description, null: false
      t.belongs_to :user

      t.timestamps
    end
  end
end
