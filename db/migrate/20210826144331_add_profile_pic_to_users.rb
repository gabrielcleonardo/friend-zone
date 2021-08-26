class AddProfilePicToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profile_pic, :string, default: "icons8-avatar-144_cmjsux"
  end
end
