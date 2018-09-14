class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :first_name, null: false
		t.string :middle_name
		t.string :last_name, null: false
		t.integer :weight
		t.integer :height
		t.string :mrn, null: false
      t.timestamps
    end
  end
end
