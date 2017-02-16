require 'test_helper'

class TipoestudiosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipoestudio = tipoestudios(:one)
  end

  test "should get index" do
    get tipoestudios_url
    assert_response :success
  end

  test "should get new" do
    get new_tipoestudio_url
    assert_response :success
  end

  test "should create tipoestudio" do
    assert_difference('Tipoestudio.count') do
      post tipoestudios_url, params: { tipoestudio: { nombre: @tipoestudio.nombre } }
    end

    assert_redirected_to tipoestudio_url(Tipoestudio.last)
  end

  test "should show tipoestudio" do
    get tipoestudio_url(@tipoestudio)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipoestudio_url(@tipoestudio)
    assert_response :success
  end

  test "should update tipoestudio" do
    patch tipoestudio_url(@tipoestudio), params: { tipoestudio: { nombre: @tipoestudio.nombre } }
    assert_redirected_to tipoestudio_url(@tipoestudio)
  end

  test "should destroy tipoestudio" do
    assert_difference('Tipoestudio.count', -1) do
      delete tipoestudio_url(@tipoestudio)
    end

    assert_redirected_to tipoestudios_url
  end
end
