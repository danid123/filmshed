class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.date :start_date
      t.time :start_time
      t.integer :duration
      t.text :description
      t.string :film_url
      t.string :image_url

      t.timestamps
    end
  end
end
