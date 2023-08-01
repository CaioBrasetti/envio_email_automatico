require "test_helper"

class MesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mes_index_url
    assert_response :success
  end
end
