require 'test_helper'

class UbicacionviviendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ubicacionvivienda = ubicacionviviendas(:one)
  end

  test "should get index" do
    get ubicacionviviendas_url
    assert_response :success
  end

  test "should get new" do
    get new_ubicacionvivienda_url
    assert_response :success
  end

  test "should create ubicacionvivienda" do
    assert_difference('Ubicacionvivienda.count') do
      post ubicacionviviendas_url, params: { ubicacionvivienda: { nombre: @ubicacionvivienda.nombre } }
    end

    assert_redirected_to ubicacionvivienda_url(Ubicacionvivienda.last)
  end

  test "should show ubicacionvivienda" do
    get ubicacionvivienda_url(@ubicacionvivienda)
    assert_response :success
  end

  test "should get edit" do
    get edit_ubicacionvivienda_url(@ubicacionvivienda)
    assert_response :success
  end

  test "should update ubicacionvivienda" do
    patch ubicacionvivienda_url(@ubicacionvivienda), params: { ubicacionvivienda: { nombre: @ubicacionvivienda.nombre } }
    assert_redirected_to ubicacionvivienda_url(@ubicacionvivienda)
  end

  test "should destroy ubicacionvivienda" do
    assert_difference('Ubicacionvivienda.count', -1) do
      delete ubicacionvivienda_url(@ubicacionvivienda)
    end

    assert_redirected_to ubicacionviviendas_url
  end
end
