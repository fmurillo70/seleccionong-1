require 'test_helper'

class TipocontactosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipocontacto = tipocontactos(:one)
  end

  test "should get index" do
    get tipocontactos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipocontacto_url
    assert_response :success
  end

  test "should create tipocontacto" do
    assert_difference('Tipocontacto.count') do
      post tipocontactos_url, params: { tipocontacto: { nombre: @tipocontacto.nombre } }
    end

    assert_redirected_to tipocontacto_url(Tipocontacto.last)
  end

  test "should show tipocontacto" do
    get tipocontacto_url(@tipocontacto)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipocontacto_url(@tipocontacto)
    assert_response :success
  end

  test "should update tipocontacto" do
    patch tipocontacto_url(@tipocontacto), params: { tipocontacto: { nombre: @tipocontacto.nombre } }
    assert_redirected_to tipocontacto_url(@tipocontacto)
  end

  test "should destroy tipocontacto" do
    assert_difference('Tipocontacto.count', -1) do
      delete tipocontacto_url(@tipocontacto)
    end

    assert_redirected_to tipocontactos_url
  end
end
