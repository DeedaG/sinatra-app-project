class AddColumn < ActiveRecord::Migration[5.2]
  def change
    add_column(:dentists, :name, :string)
  end
end
