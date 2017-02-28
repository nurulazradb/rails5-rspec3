require 'rails_helper'

RSpec.describe Blog do

  let(:blog) { Blog.new(Factory.blog_attributes) }

  describe  "attributes" do

    it { should validate_presence_of   :title }
    it { should validate_uniqueness_of :title }

    it { should validate_presence_of   :comments_feed_url }
    it { should validate_uniqueness_of :comments_feed_url }

    it { should have_many :comments }

    it "save attributes" do
      blog.save!

      expect(blog).to be_valid
    end

  end

  describe "permalink" do

    it "builds from title" do
      blog.build_permalink

      expect(blog.permalink).to eq 'my-blog'
    end

  end

  describe "refresh comments" do

    it "populates comments" do
      stub_network
      blog.save!
      blog.comments.refresh

      expect(blog.comments.length).to eq 10
    end
  end

end
