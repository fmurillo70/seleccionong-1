require 'test_helper'

class UltimotitulosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ultimotitulo = ultimotitulos(:one)
  end

  test "should get index" do
    get ultimotitulos_url
    assert_response :success
  end

  test "should get new" do
    get new_ultimotitulo_url
    assert_response :success
  end

  test "should create ultimotitulo" do
    assert_difference('Ultimotitulo.count') do
      post ultimotitulos_url, params: { ultimotitulo: { nombre: @ultimotitulo.nombre } }
    end

    assert_redirected_to ultimotitulo_url(Ultimotitulo.last)
  end

  test "should show ultimotitulo" do
    get ultimotitulo_url(@ultimotitulo)
    assert_response :success
  end

  test "should get edit" do
    get edit_ultimotitulo_url(@ultimotitulo)
    assert_response :success
  end

  test "should update ultimotitulo" do
    patch ultimotitulo_url(@ultimotitulo), params: { ultimotitulo: { nombre: @ultimotitulo.nombre } }
    assert_redirected_to ultimotitulo_url(@ultimotitulo)
  end

  test "should destroy ultimotitulo" do
    assert_difference('Ultimotitulo.count', -1) do
      delete ultimotitulo_url(@ultimotitulo)
    end

    assert_redirected_to ultimotitulos_url
  end
end
