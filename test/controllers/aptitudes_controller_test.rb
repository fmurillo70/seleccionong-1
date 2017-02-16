require 'test_helper'

class AptitudesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aptitude = aptitudes(:one)
  end

  test "should get index" do
    get aptitudes_url
    assert_response :success
  end

  test "should get new" do
    get new_aptitude_url
    assert_response :success
  end

  test "should create aptitude" do
    assert_difference('Aptitude.count') do
      post aptitudes_url, params: { aptitude: { nombre: @aptitude.nombre } }
    end

    assert_redirected_to aptitude_url(Aptitude.last)
  end

  test "should show aptitude" do
    get aptitude_url(@aptitude)
    assert_response :success
  end

  test "should get edit" do
    get edit_aptitude_url(@aptitude)
    assert_response :success
  end

  test "should update aptitude" do
    patch aptitude_url(@aptitude), params: { aptitude: { nombre: @aptitude.nombre } }
    assert_redirected_to aptitude_url(@aptitude)
  end

  test "should destroy aptitude" do
    assert_difference('Aptitude.count', -1) do
      delete aptitude_url(@aptitude)
    end

    assert_redirected_to aptitudes_url
  end
end
