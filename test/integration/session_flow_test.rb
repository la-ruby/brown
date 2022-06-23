require "test_helper"

class SessionFlowTest < ActionDispatch::IntegrationTest
  setup do
    create(:user)
  end

  test 'can log in' do
    get '/'
    follow_redirect!
    post user_session_path, params: {'user'=>{'email'=>FIRST_USER_EMAIL, 'password'=>FIRST_USER_PASSWORD}}
    follow_redirect!
    follow_redirect!
    assert_equal 'testing', response.body
  end
end
