class Blog < ApplicationRecord

  validates :title, :comments_feed_url, presence: true, uniqueness: true

  before_validation :build_permalink, on: :create

  scope :recent, -> { order(:created_at).reverse_order.limit(10) }

  has_many :comments do

    def refresh
      # because we are in blog.comments which belongs to blog, owner here refer to blog
      comments_feed_url = proxy_association.owner.comments_feed_url
      comment_data = Wordpress::Comments::Client.new(comments_feed_url).fetch
      create_from_wordpress_client_attributes comment_data
    end

    def create_from_wordpress_client_attributes comment_data
      comment_data.map do |a_comment|
        attributes = a_comment.dup
        attributes[:opined_at] = attributes.delete(:date)
        comment = new(attributes)
        if comment.save!
          comment
        end
      end
    end

  end

  def build_permalink
    if self.title
      self.permalink = self.title.parameterize
    end
  end

  def to_param
    permalink
  end

end
