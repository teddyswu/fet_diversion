class FetBrandUrl < ActiveRecord::Base
  belongs_to :brand, :class_name => "Brand", :foreign_key => "brand_id"
end
