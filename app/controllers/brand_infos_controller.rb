class BrandInfosController < ApplicationController
	def index
		@fet_brands = FetBrandUrl.all.order("updated_at asc")
	end
end
