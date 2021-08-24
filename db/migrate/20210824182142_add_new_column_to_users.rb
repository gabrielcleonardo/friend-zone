class AddNewColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :cpf, :string
    add_column :users, :user_name, :string
    add_column :users, :is_available, :boolean, default: true
    add_column :users, :is_professional, :boolean, default: false
  end
end
