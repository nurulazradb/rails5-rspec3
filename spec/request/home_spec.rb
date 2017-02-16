require 'rails_helper'

RSpec.describe "Home Page" do
  describe "GET /" do

    it "render success" do
      visit '/'
      expect(page.status_code).to eq(200)
    end

  end
end
