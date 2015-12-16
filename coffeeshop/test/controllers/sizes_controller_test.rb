require 'test_helper'

class SizesControllerTest < ActionController::TestCase
  setup do
    @size = sizes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sizes)
  end

  test "should create size" do
    assert_difference('Size.count') do
      post :create, size: { name: @size.name }
    end

    assert_response 201
  end

  test "should show size" do
    get :show, id: @size
    assert_response :success
  end

  test "should update size" do
    put :update, id: @size, size: { name: @size.name }
    assert_response 204
  end

  test "should destroy size" do
    assert_difference('Size.count', -1) do
      delete :destroy, id: @size
    end

    assert_response 204
  end
end
