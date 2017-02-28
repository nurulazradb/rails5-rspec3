class Blog < ApplicationRecord

  validates :title, :comments_feed_url, presence: true, uniqueness: true

  before_validation :build_permalink, on: :create

  has_many :comments

  def build_permalink
    if self.title
      self.permalink = self.title.parameterize
    end
  end

  def to_param
    permalink
  end

end
