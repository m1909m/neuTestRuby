require 'test_helper'

class CurrentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get current_index_url
    assert_response :success
  end

end
