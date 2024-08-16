class Article < ApplicationRecord
  include Visible
  has_many :comments, dependent: :destroy #by using dependent: :depent if article has been delete comment belong to it will deleted
  validates :title, presence: true
  validates :body, presence: true, length: {minimum:10}
end
