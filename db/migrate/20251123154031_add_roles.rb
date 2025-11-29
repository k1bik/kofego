class AddRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :roles do |t|
      t.string :name, null: false
      t.string :system_type, null: true
    end

    add_reference :users, :role, null: false, foreign_key: true
    add_index :roles, :name, unique: true
  end
end
