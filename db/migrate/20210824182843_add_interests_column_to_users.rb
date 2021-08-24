class AddInterestsColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :interests, :string, array: true
  end
end
