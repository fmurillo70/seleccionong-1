require 'test_helper'

class TipoEstadoCivilsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_estado_civil = tipo_estado_civils(:one)
  end

  test "should get index" do
    get tipo_estado_civils_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_estado_civil_url
    assert_response :success
  end

  test "should create tipo_estado_civil" do
    assert_difference('TipoEstadoCivil.count') do
      post tipo_estado_civils_url, params: { tipo_estado_civil: { nombre: @tipo_estado_civil.nombre } }
    end

    assert_redirected_to tipo_estado_civil_url(TipoEstadoCivil.last)
  end

  test "should show tipo_estado_civil" do
    get tipo_estado_civil_url(@tipo_estado_civil)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_estado_civil_url(@tipo_estado_civil)
    assert_response :success
  end

  test "should update tipo_estado_civil" do
    patch tipo_estado_civil_url(@tipo_estado_civil), params: { tipo_estado_civil: { nombre: @tipo_estado_civil.nombre } }
    assert_redirected_to tipo_estado_civil_url(@tipo_estado_civil)
  end

  test "should destroy tipo_estado_civil" do
    assert_difference('TipoEstadoCivil.count', -1) do
      delete tipo_estado_civil_url(@tipo_estado_civil)
    end

    assert_redirected_to tipo_estado_civils_url
  end
end
