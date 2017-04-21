class UrlImportsController < ApplicationController
	require 'csv'
	skip_before_filter  :verify_authenticity_token

	def index
	end

  def create
  	cvs_upload = CsvUpload.new
  	cvs_upload.file = url_params
    cvs_upload.save!
    csv_text = params[:data_file].tempfile
    csv = CSV.parse(csv_text, :headers => true)
    ary = Array.new
    cn = 0
    csv.each do |item|
      item.each_with_index { |d,i| cn -= 1 if item[i] == ( "" and nil)} 
      cp = FProduct.find_by_id(item[1].to_i)
      if cn == 0 && cp.present?
      	check_product = FetProductUrl.find_by_guid(item[1].to_i)
      	check_product.destroy if check_product.present?
      	product_url = FetProductUrl.new
      	product_url.name = item[0].to_s
      	product_url.guid = item[1].to_i
      	product_url.product_pc_url = item[2].to_s
      	product_url.product_mobi_url = item[3].to_s
      	product_url.review_pc_url = item[4].to_s
      	product_url.review_mobi_url = item[5].to_s
      	product_url.status = item[6].to_i
      	product_url.save!
        cps = ProductFetShip.find_by_product_id(cp.product_id)
        cps.destroy if cps.present?
        product_fet_ship = ProductFetShip.new
        product_fet_ship.product_id = cp.product_id
        product_fet_ship.guid = item[1].to_i
        product_fet_ship.save!
      	ary << item[0]
      end
    end
    @product_info = ary
    render :action => "index"
  end
  def url_params
    params.require(:data_file)
  end

end
