class Product < ActiveRecord::Base
  belongs_to :type
  belongs_to :size
  has_many :orders_products
  has_many :orders, :through => :orders_products
  validates :name, uniqueness: { case_sensitive: false, :scope => [:type, :size] }
  validates :name, presence: true
  validates :type_id, presence: true
  validates :size_id, presence: true
  validates :price, presence: true
end
