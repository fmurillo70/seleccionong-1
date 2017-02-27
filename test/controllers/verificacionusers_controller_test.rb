require 'test_helper'

class VerificacionusersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get verificacionusers_index_url
    assert_response :success
  end

end
