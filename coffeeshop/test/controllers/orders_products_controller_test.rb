require 'test_helper'

class OrdersProductsControllerTest < ActionController::TestCase
  setup do
    @orders_product = orders_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders_products)
  end

  test "should create orders_product" do
    assert_difference('OrdersProduct.count') do
      post :create, orders_product: { hot: @orders_product.hot, order_id: @orders_product.order_id, product_id: @orders_product.product_id }
    end

    assert_response 201
  end

  test "should show orders_product" do
    get :show, id: @orders_product
    assert_response :success
  end

  test "should update orders_product" do
    put :update, id: @orders_product, orders_product: { hot: @orders_product.hot, order_id: @orders_product.order_id, product_id: @orders_product.product_id }
    assert_response 204
  end

  test "should destroy orders_product" do
    assert_difference('OrdersProduct.count', -1) do
      delete :destroy, id: @orders_product
    end

    assert_response 204
  end
end
