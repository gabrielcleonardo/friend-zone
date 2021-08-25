class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :user_1, null: false,  foreign_key: { to_table: :users }
      t.references :user_2, null: false,  foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
