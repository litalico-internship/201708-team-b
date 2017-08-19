class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :age, :integer, null: false
    add_column :users, :location, :string, null: false
    add_column :users, :sexuality, :integer, null: false
    add_column :users, :name, :string
    add_column :users, :icon_image, :string
    add_column :users, :description, :text
  end
end
