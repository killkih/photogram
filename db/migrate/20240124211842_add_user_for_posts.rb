class AddUserForPosts < ActiveRecord::Migration[7.1]
  def change
    change_table :posts do |t|
      t.belongs_to :user, null: false, foreign_key: true
    end
  end
end
