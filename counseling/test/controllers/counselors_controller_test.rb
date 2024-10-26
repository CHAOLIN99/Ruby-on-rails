require "test_helper"

class CounselorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get counselors_index_url
    assert_response :success
  end
end
