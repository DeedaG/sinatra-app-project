class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :dentist_id
      t.string :insurance
      t.string :email
      t.string :history

    end
  end
end
