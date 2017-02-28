# Override network access and return sample data.
def stub_network
  xml = File.read(File.join('spec', 'fixtures', 'files', 'feed.xml'))
  allow_any_instance_of(Wordpress::Comments::Client).to receive(:get).and_return(xml)
end
