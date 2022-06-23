require "test_helper"

class SessionFlowTest < ActionDispatch::IntegrationTest
  test 'can save my settings' do
    get '/my_settings'
  end
end
