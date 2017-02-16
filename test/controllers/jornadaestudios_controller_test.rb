require 'test_helper'

class JornadaestudiosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jornadaestudio = jornadaestudios(:one)
  end

  test "should get index" do
    get jornadaestudios_url
    assert_response :success
  end

  test "should get new" do
    get new_jornadaestudio_url
    assert_response :success
  end

  test "should create jornadaestudio" do
    assert_difference('Jornadaestudio.count') do
      post jornadaestudios_url, params: { jornadaestudio: { nombre: @jornadaestudio.nombre } }
    end

    assert_redirected_to jornadaestudio_url(Jornadaestudio.last)
  end

  test "should show jornadaestudio" do
    get jornadaestudio_url(@jornadaestudio)
    assert_response :success
  end

  test "should get edit" do
    get edit_jornadaestudio_url(@jornadaestudio)
    assert_response :success
  end

  test "should update jornadaestudio" do
    patch jornadaestudio_url(@jornadaestudio), params: { jornadaestudio: { nombre: @jornadaestudio.nombre } }
    assert_redirected_to jornadaestudio_url(@jornadaestudio)
  end

  test "should destroy jornadaestudio" do
    assert_difference('Jornadaestudio.count', -1) do
      delete jornadaestudio_url(@jornadaestudio)
    end

    assert_redirected_to jornadaestudios_url
  end
end
