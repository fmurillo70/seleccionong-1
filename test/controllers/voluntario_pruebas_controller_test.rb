require 'test_helper'

class VoluntarioPruebasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voluntario_prueba = voluntario_pruebas(:one)
  end

  test "should get index" do
    get voluntario_pruebas_url
    assert_response :success
  end

  test "should get new" do
    get new_voluntario_prueba_url
    assert_response :success
  end

  test "should create voluntario_prueba" do
    assert_difference('VoluntarioPrueba.count') do
      post voluntario_pruebas_url, params: { voluntario_prueba: {  } }
    end

    assert_redirected_to voluntario_prueba_url(VoluntarioPrueba.last)
  end

  test "should show voluntario_prueba" do
    get voluntario_prueba_url(@voluntario_prueba)
    assert_response :success
  end

  test "should get edit" do
    get edit_voluntario_prueba_url(@voluntario_prueba)
    assert_response :success
  end

  test "should update voluntario_prueba" do
    patch voluntario_prueba_url(@voluntario_prueba), params: { voluntario_prueba: {  } }
    assert_redirected_to voluntario_prueba_url(@voluntario_prueba)
  end

  test "should destroy voluntario_prueba" do
    assert_difference('VoluntarioPrueba.count', -1) do
      delete voluntario_prueba_url(@voluntario_prueba)
    end

    assert_redirected_to voluntario_pruebas_url
  end
end
