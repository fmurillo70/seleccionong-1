require 'test_helper'

class AfichesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @afich = afiches(:one)
  end

  test "should get index" do
    get afiches_url
    assert_response :success
  end

  test "should get new" do
    get new_afich_url
    assert_response :success
  end

  test "should create afich" do
    assert_difference('Afich.count') do
      post afiches_url, params: { afich: { actividadasociada: @afich.actividadasociada, beneficiarios: @afich.beneficiarios, comosehace: @afich.comosehace, coordinador: @afich.coordinador, experiencia: @afich.experiencia, horario: @afich.horario, incentivos: @afich.incentivos, nombreorg: @afich.nombreorg, nombrepuesto: @afich.nombrepuesto, objetivospuesto: @afich.objetivospuesto, periocidadincentivos: @afich.periocidadincentivos, quesehace: @afich.quesehace, requisitos: @afich.requisitos } }
    end

    assert_redirected_to afich_url(Afich.last)
  end

  test "should show afich" do
    get afich_url(@afich)
    assert_response :success
  end

  test "should get edit" do
    get edit_afich_url(@afich)
    assert_response :success
  end

  test "should update afich" do
    patch afich_url(@afich), params: { afich: { actividadasociada: @afich.actividadasociada, beneficiarios: @afich.beneficiarios, comosehace: @afich.comosehace, coordinador: @afich.coordinador, experiencia: @afich.experiencia, horario: @afich.horario, incentivos: @afich.incentivos, nombreorg: @afich.nombreorg, nombrepuesto: @afich.nombrepuesto, objetivospuesto: @afich.objetivospuesto, periocidadincentivos: @afich.periocidadincentivos, quesehace: @afich.quesehace, requisitos: @afich.requisitos } }
    assert_redirected_to afich_url(@afich)
  end

  test "should destroy afich" do
    assert_difference('Afich.count', -1) do
      delete afich_url(@afich)
    end

    assert_redirected_to afiches_url
  end
end
