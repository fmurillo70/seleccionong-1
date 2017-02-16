require 'test_helper'

class DetalleubicacionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detalleubicacion = detalleubicacions(:one)
  end

  test "should get index" do
    get detalleubicacions_url
    assert_response :success
  end

  test "should get new" do
    get new_detalleubicacion_url
    assert_response :success
  end

  test "should create detalleubicacion" do
    assert_difference('Detalleubicacion.count') do
      post detalleubicacions_url, params: { detalleubicacion: { nombre: @detalleubicacion.nombre, ubicacionvivienda_id: @detalleubicacion.ubicacionvivienda_id } }
    end

    assert_redirected_to detalleubicacion_url(Detalleubicacion.last)
  end

  test "should show detalleubicacion" do
    get detalleubicacion_url(@detalleubicacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_detalleubicacion_url(@detalleubicacion)
    assert_response :success
  end

  test "should update detalleubicacion" do
    patch detalleubicacion_url(@detalleubicacion), params: { detalleubicacion: { nombre: @detalleubicacion.nombre, ubicacionvivienda_id: @detalleubicacion.ubicacionvivienda_id } }
    assert_redirected_to detalleubicacion_url(@detalleubicacion)
  end

  test "should destroy detalleubicacion" do
    assert_difference('Detalleubicacion.count', -1) do
      delete detalleubicacion_url(@detalleubicacion)
    end

    assert_redirected_to detalleubicacions_url
  end
end
