class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    render json: @orders
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    render json: @order
  end

  # POST /orders
  # POST /orders.json
  def create
    # @order = Order.new()    
    total = 0
    
    @order = Order.new()
    for product in params[:_json]           
      @product = Product.find_by_name_and_size_id(product[:product], product[:size])      
      if @product.nil?
        # Handle case when order invalid products
        render json: "", status: :not_found
        return
      end  
      total = total + @product.price * product[:quantity].to_f                  
      @order.orders_products << OrdersProduct.new(:product => @product, :hot => product[:hot], :quantity => product[:quantity])      
    end    

    @order.total = total

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    if @order.update(order_params)
      head :no_content
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy

    head :no_content
  end

  def detail_orders
    @orders = OrdersProduct.joins(:order).joins(:product).select("products.name, products.type_id, products.size_id, orders.id, orders.created_at, orders_products.quantity, orders_products.hot")
    render json:  @orders
  end

  def detail_orders_revenue
    @orders = Order.sum(:total)
    render json:  @orders
  end

  private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:total)
    end
end
