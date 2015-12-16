class OrdersProductsController < ApplicationController
  before_action :set_orders_product, only: [:show, :update, :destroy]

  # GET /orders_products
  # GET /orders_products.json
  def index
    @orders_products = OrdersProduct.all

    render json: @orders_products
  end

  # GET /orders_products/1
  # GET /orders_products/1.json
  def show
    render json: @orders_product
  end

  # POST /orders_products
  # POST /orders_products.json
  def create
    @orders_product = OrdersProduct.new(orders_product_params)

    if @orders_product.save
      render json: @orders_product, status: :created, location: @orders_product
    else
      render json: @orders_product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders_products/1
  # PATCH/PUT /orders_products/1.json
  def update
    @orders_product = OrdersProduct.find(params[:id])

    if @orders_product.update(orders_product_params)
      head :no_content
    else
      render json: @orders_product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders_products/1
  # DELETE /orders_products/1.json
  def destroy
    @orders_product.destroy

    head :no_content
  end

  private

    def set_orders_product
      @orders_product = OrdersProduct.find(params[:id])
    end

    def orders_product_params
      params.require(:orders_product).permit(:order_id, :product_id, :hot)
    end
end
