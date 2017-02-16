require 'test_helper'

class OpcionesRespuestaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @opciones_respuestum = opciones_respuesta(:one)
  end

  test "should get index" do
    get opciones_respuesta_url
    assert_response :success
  end

  test "should get new" do
    get new_opciones_respuestum_url
    assert_response :success
  end

  test "should create opciones_respuestum" do
    assert_difference('OpcionesRespuestum.count') do
      post opciones_respuesta_url, params: { opciones_respuestum: { nombre: @opciones_respuestum.nombre, valor: @opciones_respuestum.valor } }
    end

    assert_redirected_to opciones_respuestum_url(OpcionesRespuestum.last)
  end

  test "should show opciones_respuestum" do
    get opciones_respuestum_url(@opciones_respuestum)
    assert_response :success
  end

  test "should get edit" do
    get edit_opciones_respuestum_url(@opciones_respuestum)
    assert_response :success
  end

  test "should update opciones_respuestum" do
    patch opciones_respuestum_url(@opciones_respuestum), params: { opciones_respuestum: { nombre: @opciones_respuestum.nombre, valor: @opciones_respuestum.valor } }
    assert_redirected_to opciones_respuestum_url(@opciones_respuestum)
  end

  test "should destroy opciones_respuestum" do
    assert_difference('OpcionesRespuestum.count', -1) do
      delete opciones_respuestum_url(@opciones_respuestum)
    end

    assert_redirected_to opciones_respuesta_url
  end
end
