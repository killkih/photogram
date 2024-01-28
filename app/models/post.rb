# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  validates :content, presence: true

  scope :sort_by_date, -> { order(created_at: :desc)}
end
