class ProductInfosController < ApplicationController
	def index
		@fet_products = FetProductUrl.all.order("updated_at asc")
	end
end
