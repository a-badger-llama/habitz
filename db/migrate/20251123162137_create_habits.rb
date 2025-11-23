class CreateHabits < ActiveRecord::Migration[7.1]
  def change
    create_table :habits do |t|
      t.string :name
      t.string :frequency_type
      t.integer :frequency_value
      t.time :remind_at
      t.text :notes

      t.timestamps
    end
  end
end
