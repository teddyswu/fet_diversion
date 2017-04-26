class ProductInfosController < ApplicationController
	def index
		@fet_products = FetProductUrl.find_by_sql("select * from fet_product_urls INNER JOIN product_fet_ships ON product_fet_ships.guid = fet_product_urls.guid ORDER BY fet_product_urls.updated_at asc limit 30")
	end

	def search
		@fet_products = FetProductUrl.find_by_sql(["select * from fet_product_urls INNER JOIN product_fet_ships ON product_fet_ships.guid = fet_product_urls.guid where fet_product_urls.guid like ? or fet_product_urls.name like ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%"])
	end
end
