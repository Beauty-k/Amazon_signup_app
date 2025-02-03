require "test_helper"

class AmazonCloneControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get amazon_clone_index_url
    assert_response :success
  end
end
