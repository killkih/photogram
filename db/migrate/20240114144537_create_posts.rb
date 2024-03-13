# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :content, null: false
      t.text :body

      t.timestamps
    end
  end
end
