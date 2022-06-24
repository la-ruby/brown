require "test_helper"

class MyPropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in create(:user)
  end

  test "should get index" do
    get my_properties_url
    assert_response :success
  end
end
