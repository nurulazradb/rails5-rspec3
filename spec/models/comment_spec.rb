require 'rails_helper'

RSpec.describe Comment, type: :model do

  let(:comment) { Comment.new }

  it { should validate_uniqueness_of :link }

end
