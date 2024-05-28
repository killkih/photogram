# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validates :email, uniqueness: { case_sensitive: false }, format: URI::MailTo::EMAIL_REGEXP
  validates :nickname, :email, presence: true
end
