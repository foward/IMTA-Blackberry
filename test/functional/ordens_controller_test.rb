require 'test_helper'

class OrdensControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ordens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orden" do
    assert_difference('Orden.count') do
      post :create, :orden => { }
    end

    assert_redirected_to orden_path(assigns(:orden))
  end

  test "should show orden" do
    get :show, :id => ordens(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ordens(:one).to_param
    assert_response :success
  end

  test "should update orden" do
    put :update, :id => ordens(:one).to_param, :orden => { }
    assert_redirected_to orden_path(assigns(:orden))
  end

  test "should destroy orden" do
    assert_difference('Orden.count', -1) do
      delete :destroy, :id => ordens(:one).to_param
    end

    assert_redirected_to ordens_path
  end
end
