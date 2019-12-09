require 'test_helper'

class CardOwnershipsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get card_ownerships_new_url
    assert_response :success
  end

  test "should get edit" do
    get card_ownerships_edit_url
    assert_response :success
  end

end
