require 'rails_helper'

RSpec.describe Blog do

  let(:blog) { Blog.new(title: 'My Blog', comments_feed_url: 'http://example.com/comments/feed') }

  it "save attributes" do
    blog.save!

    expect(blog).to be_valid
  end

end
