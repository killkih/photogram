# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy

  validates :content, presence: true

  scope :sort_by_date, -> { order(created_at: :desc) }
end
