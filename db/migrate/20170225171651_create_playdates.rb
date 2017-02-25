class CreatePlaydates < ActiveRecord::Migration[5.0]
  def change
    create_table :playdates do |t|
      t.string :location
      t.string :start_time
      t.string :end_time
      t.text :description
      t.belongs_to :dog

      t.timestamps
    end
  end
end
