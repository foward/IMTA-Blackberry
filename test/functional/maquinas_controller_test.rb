require 'test_helper'

class MaquinasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maquinas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maquina" do
    assert_difference('Maquina.count') do
      post :create, :maquina => { }
    end

    assert_redirected_to maquina_path(assigns(:maquina))
  end

  test "should show maquina" do
    get :show, :id => maquinas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => maquinas(:one).to_param
    assert_response :success
  end

  test "should update maquina" do
    put :update, :id => maquinas(:one).to_param, :maquina => { }
    assert_redirected_to maquina_path(assigns(:maquina))
  end

  test "should destroy maquina" do
    assert_difference('Maquina.count', -1) do
      delete :destroy, :id => maquinas(:one).to_param
    end

    assert_redirected_to maquinas_path
  end
end
