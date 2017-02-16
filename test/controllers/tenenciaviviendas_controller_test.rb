require 'test_helper'

class TenenciaviviendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tenenciavivienda = tenenciaviviendas(:one)
  end

  test "should get index" do
    get tenenciaviviendas_url
    assert_response :success
  end

  test "should get new" do
    get new_tenenciavivienda_url
    assert_response :success
  end

  test "should create tenenciavivienda" do
    assert_difference('Tenenciavivienda.count') do
      post tenenciaviviendas_url, params: { tenenciavivienda: { nombre: @tenenciavivienda.nombre } }
    end

    assert_redirected_to tenenciavivienda_url(Tenenciavivienda.last)
  end

  test "should show tenenciavivienda" do
    get tenenciavivienda_url(@tenenciavivienda)
    assert_response :success
  end

  test "should get edit" do
    get edit_tenenciavivienda_url(@tenenciavivienda)
    assert_response :success
  end

  test "should update tenenciavivienda" do
    patch tenenciavivienda_url(@tenenciavivienda), params: { tenenciavivienda: { nombre: @tenenciavivienda.nombre } }
    assert_redirected_to tenenciavivienda_url(@tenenciavivienda)
  end

  test "should destroy tenenciavivienda" do
    assert_difference('Tenenciavivienda.count', -1) do
      delete tenenciavivienda_url(@tenenciavivienda)
    end

    assert_redirected_to tenenciaviviendas_url
  end
end
