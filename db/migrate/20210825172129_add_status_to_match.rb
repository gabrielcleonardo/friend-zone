class AddStatusToMatch < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :status, :boolean, default: false
  end
end
