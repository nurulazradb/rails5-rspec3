# Override network access and return sample data.
def stub_network
  xml = Factory.comments_feed_xml
  allow_any_instance_of(Wordpress::Comments::Client).to receive(:get).and_return(xml)
end
