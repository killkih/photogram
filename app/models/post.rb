# frozen_string_literal: true

class Post < ApplicationRecord
  validates :content, presence: true

  scope :sort_by_date, -> { order(created_at: :desc)}
end
