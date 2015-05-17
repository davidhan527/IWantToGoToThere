class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
