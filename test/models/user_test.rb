require 'test_helper'
require 'faker'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(fname: 'Bob', lname: 'Smith', email: 'test@example.com', username: "bsmith")
  end
  test 'the truth' do 
    assert true
  end
end
