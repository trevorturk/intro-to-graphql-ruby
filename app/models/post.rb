class Post < ApplicationRecord
  belongs_to :author
  scope :published, -> { where(published: true) }
  validates :title, uniqueness: true
end
