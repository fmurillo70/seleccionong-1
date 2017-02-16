require 'test_helper'

class PruebasCompetenciaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pruebas_competencium = pruebas_competencia(:one)
  end

  test "should get index" do
    get pruebas_competencia_url
    assert_response :success
  end

  test "should get new" do
    get new_pruebas_competencium_url
    assert_response :success
  end

  test "should create pruebas_competencium" do
    assert_difference('PruebasCompetencium.count') do
      post pruebas_competencia_url, params: { pruebas_competencium: { nombre: @pruebas_competencium.nombre } }
    end

    assert_redirected_to pruebas_competencium_url(PruebasCompetencium.last)
  end

  test "should show pruebas_competencium" do
    get pruebas_competencium_url(@pruebas_competencium)
    assert_response :success
  end

  test "should get edit" do
    get edit_pruebas_competencium_url(@pruebas_competencium)
    assert_response :success
  end

  test "should update pruebas_competencium" do
    patch pruebas_competencium_url(@pruebas_competencium), params: { pruebas_competencium: { nombre: @pruebas_competencium.nombre } }
    assert_redirected_to pruebas_competencium_url(@pruebas_competencium)
  end

  test "should destroy pruebas_competencium" do
    assert_difference('PruebasCompetencium.count', -1) do
      delete pruebas_competencium_url(@pruebas_competencium)
    end

    assert_redirected_to pruebas_competencia_url
  end
end
