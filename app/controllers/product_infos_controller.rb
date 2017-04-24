class ProductInfosController < ApplicationController
	def index
		@fet_products = FetProductUrl.all.order("updated_at asc").limit(30)
	end

	def search
		@fet_products = FetProductUrl.where( [ "guid like ? or name like ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%" ] )
	end
end
