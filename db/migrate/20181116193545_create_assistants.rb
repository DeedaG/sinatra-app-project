class CreateAssistants < ActiveRecord::Migration[5.2]
  def change
    create_table :assistants do |t|
      t.string :name
      t.integer :dentist_id
      t.string :position
      t.string :skills
    end
  end
end
