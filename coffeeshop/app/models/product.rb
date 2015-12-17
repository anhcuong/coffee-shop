class Product < ActiveRecord::Base
  
  filterrific(
	available_filters: [
	  :name,
	  :type,
	  :size,
	  :price
	]
  )
  
  belongs_to :type
  belongs_to :size
  has_many :orders_products
  has_many :orders, :through => :orders_products
  validates :name, uniqueness: { case_sensitive: false, scope: :type, scope: :size }
end
