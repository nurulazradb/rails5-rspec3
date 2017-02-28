class Blog < ApplicationRecord

  validates :title, :comments_feed_url, presence: true, uniqueness: true

end
