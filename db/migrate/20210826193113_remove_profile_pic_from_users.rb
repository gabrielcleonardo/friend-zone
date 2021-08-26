class RemoveProfilePicFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :profile_pic

  end
end
