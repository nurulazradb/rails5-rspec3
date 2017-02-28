class Comment < ApplicationRecord
  belongs_to :blog

  validates :link, uniqueness: true
end
