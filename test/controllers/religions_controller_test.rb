require 'test_helper'

class ReligionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @religion = religions(:one)
  end

  test "should get index" do
    get religions_url
    assert_response :success
  end

  test "should get new" do
    get new_religion_url
    assert_response :success
  end

  test "should create religion" do
    assert_difference('Religion.count') do
      post religions_url, params: { religion: { nombre: @religion.nombre } }
    end

    assert_redirected_to religion_url(Religion.last)
  end

  test "should show religion" do
    get religion_url(@religion)
    assert_response :success
  end

  test "should get edit" do
    get edit_religion_url(@religion)
    assert_response :success
  end

  test "should update religion" do
    patch religion_url(@religion), params: { religion: { nombre: @religion.nombre } }
    assert_redirected_to religion_url(@religion)
  end

  test "should destroy religion" do
    assert_difference('Religion.count', -1) do
      delete religion_url(@religion)
    end

    assert_redirected_to religions_url
  end
end
