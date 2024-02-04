class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, presence: true

  scope :sort_by_date, -> { order(created_at: :asc) }
end
