class FetProductUrl < ActiveRecord::Base
  has_one :product, :through => :product_fet_ship
  has_one :product_fet_ship, :foreign_key => "guid"
end
