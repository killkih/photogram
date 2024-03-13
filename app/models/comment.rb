class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, presence: true

  scope :sort_by_date, -> { order(created_at: :asc) }

  def can_destroy?(current_user)
    current_user == user || current_user == post.user
  end
end
