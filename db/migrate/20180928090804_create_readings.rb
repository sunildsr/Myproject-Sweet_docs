class CreateReadings < ActiveRecord::Migration[5.0]
  def change
    create_table :readings do |t|
      t.integer :glucose_reading
	  t.integer  :created_by
      t.timestamps
    end
  end
end
