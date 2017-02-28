require 'rails_helper'

describe "Blogs detail" do
  describe "GET /blogs/:id" do

    fixtures :blogs

    before(:each) do
      blog = blogs(:mashable)
      stub_network
      blog.comments.refresh

      visit '/blogs/mashable'
    end

    it "responds with success" do
      expect(page.status_code).to be(200)
    end

    describe "individual comment" do

      it "renders a link to the comment" do
        # save_and_open_page
        link_text = "What a Snapchat phone could look like"

        expect(page).to have_selector "div.comment p a", text: link_text
      end

    end

  end
end
