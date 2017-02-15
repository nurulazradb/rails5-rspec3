require 'nokogiri'

module Wordpress
  module Comments
    class Client
      attr_reader :url

      def initialize url
        @url = url
      end

      def parse xml
        doc = Nokogiri::XML xml
        doc.search('item').map do |doc_item|
          item = {}
          item[:link] = doc_item.at('link').text
          item
        end
      end
    end
  end
end

RSpec.describe Wordpress::Comments::Client do

  describe "#initialize" do

    it "stores a URL" do
      client = Wordpress::Comments::Client.new 'http://feeds.mashable.com/mashable/tech'

      expect(client.url).to eq 'http://feeds.mashable.com/mashable/tech'
    end

  end

  describe "#parse" do

    # let(:xml) { file_fixture("feed.xml").read }
    let(:xml) { File.read(File.join('spec', 'fixtures', 'files', 'feed.xml'))}

    it "extracts the link" do
      client = Wordpress::Comments::Client.new 'http://feeds.mashable.com/mashable/tech'
      comments = client.parse xml
      comment = comments.first
      link = 'http://feeds.mashable.com/~r/mashable/tech/~3/H19a27DsGe8/'

      expect(comment[:link]).to eq link
    end

  end

end
