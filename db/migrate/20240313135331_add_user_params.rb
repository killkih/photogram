class AddUserParams < ActiveRecord::Migration[7.1]
  def change
    change_table :users do |t|
      t.string :nickname, null: false
      t.string :first_name
      t.string :last_name
      t.text :bio
    end
  end
end
