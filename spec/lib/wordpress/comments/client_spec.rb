# coding: utf-8
require_relative '../../../../lib/wordpress/comments/client'
require_relative '../../../support/match_date'

RSpec.describe Wordpress::Comments::Client do
  let (:client) { Wordpress::Comments::Client.new 'http://feeds.mashable.com/mashable/tech' }
  let(:xml) { File.read(File.join('spec', 'fixtures', 'files', 'feed.xml'))}

  describe "#initialize" do

    it "stores a URL" do
      expect(client.url).to eq 'http://feeds.mashable.com/mashable/tech'
    end

  end

  describe "#parse" do

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

    it "extracts the date" do
      # Wed, 15 Feb 2017 02:28:34 +0000
      expect(comment[:date].year).to eq 2017
    end

    it "extracts the date (redux)" do
      # Wed, 15 Feb 2017 02:28:34 +0000
      expect(comment[:date]).to match_date '2017-02-15'
    end

  end

  describe "#fetch" do

    let(:comments) { client.fetch }

    before(:each) do
      # using stub
      allow(client).to receive(:get) { xml }
    end

    it "build comment objects" do
      expect(comments.length).to eq 10
    end

  end

end
