class CreateEncounters < ActiveRecord::Migration[5.1]
  def change
    create_table :encounters do |t|
	  t.string :visit_number, null: false
	  t.datetime :admitted_at, null: false
	  t.datetime :discharged_at, null: false
	  t.string :location
	  t.integer :room
	  t.integer :bed
	  t.references :patient, foreign_key: true
      t.timestamps
    end
  end
end
