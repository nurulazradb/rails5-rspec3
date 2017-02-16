# coding: utf-8
require_relative '../../../../lib/wordpress/comments/client'

RSpec.describe Wordpress::Comments::Client do
  let (:client) { Wordpress::Comments::Client.new 'http://feeds.mashable.com/mashable/tech' }

  describe "#initialize" do

    it "stores a URL" do
      expect(client.url).to eq 'http://feeds.mashable.com/mashable/tech'
    end

  end

  describe "#parse" do

    let(:xml) { File.read(File.join('spec', 'fixtures', 'files', 'feed.xml'))}
    let (:comments) { client.parse xml }
    let (:comment) { comments.first }

    it "extracts the link" do
      link = 'http://feeds.mashable.com/~r/mashable/tech/~3/H19a27DsGe8/'

      expect(comment[:link]).to eq link
    end

    it "extracts the title" do
      title = "What a Snapchat phone could look like"

      expect(comment[:title]).to eq title
    end

    it "extracts the name of the commenter" do
      expect(comment[:commenter]).to eq 'Louise Matsakis'
    end

  end

end
