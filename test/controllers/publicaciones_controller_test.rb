require 'test_helper'

class PublicacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @publicacione = publicaciones(:one)
  end

  test "should get index" do
    get publicaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_publicacione_url
    assert_response :success
  end

  test "should create publicacione" do
    assert_difference('Publicacione.count') do
      post publicaciones_url, params: { publicacione: { contenido: @publicacione.contenido, nombre: @publicacione.nombre } }
    end

    assert_redirected_to publicacione_url(Publicacione.last)
  end

  test "should show publicacione" do
    get publicacione_url(@publicacione)
    assert_response :success
  end

  test "should get edit" do
    get edit_publicacione_url(@publicacione)
    assert_response :success
  end

  test "should update publicacione" do
    patch publicacione_url(@publicacione), params: { publicacione: { contenido: @publicacione.contenido, nombre: @publicacione.nombre } }
    assert_redirected_to publicacione_url(@publicacione)
  end

  test "should destroy publicacione" do
    assert_difference('Publicacione.count', -1) do
      delete publicacione_url(@publicacione)
    end

    assert_redirected_to publicaciones_url
  end
end
