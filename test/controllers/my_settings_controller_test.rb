require "test_helper"

class MySettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in create(:user)
  end

  test "should get index" do
    get my_settings_url
    assert_response :success
  end


  test "should update example" do
    patch "/my_settings/#{User.last.my_settings.id}", params: { "my_settings": {"service_one_username":"testing"}} , headers: { accept: Mime[:turbo_stream].to_s }
    assert_equal "200", response.code
  end
end
