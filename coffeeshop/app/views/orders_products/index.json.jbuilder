json.array!(@orders_products) do |orders_product|
  json.extract! orders_product, :id, :order_id, :product_id, :hot
  json.url orders_product_url(orders_product, format: :json)
end
