require 'test_helper'

class TipoDeSexosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_de_sexo = tipo_de_sexos(:one)
  end

  test "should get index" do
    get tipo_de_sexos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_de_sexo_url
    assert_response :success
  end

  test "should create tipo_de_sexo" do
    assert_difference('TipoDeSexo.count') do
      post tipo_de_sexos_url, params: { tipo_de_sexo: { nombre: @tipo_de_sexo.nombre } }
    end

    assert_redirected_to tipo_de_sexo_url(TipoDeSexo.last)
  end

  test "should show tipo_de_sexo" do
    get tipo_de_sexo_url(@tipo_de_sexo)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_de_sexo_url(@tipo_de_sexo)
    assert_response :success
  end

  test "should update tipo_de_sexo" do
    patch tipo_de_sexo_url(@tipo_de_sexo), params: { tipo_de_sexo: { nombre: @tipo_de_sexo.nombre } }
    assert_redirected_to tipo_de_sexo_url(@tipo_de_sexo)
  end

  test "should destroy tipo_de_sexo" do
    assert_difference('TipoDeSexo.count', -1) do
      delete tipo_de_sexo_url(@tipo_de_sexo)
    end

    assert_redirected_to tipo_de_sexos_url
  end
end
