require 'rails_helper'

RSpec.describe "Home Page" do
  describe "GET /" do

    context "empty database" do

      before(:each) do
        visit '/'
      end

      it "render success" do
        expect(page.status_code).to eq(200)
      end

    end

  end
end
