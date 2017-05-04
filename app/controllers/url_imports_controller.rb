# -*- coding: UTF-8 -*-
class UrlImportsController < ApplicationController
	require 'csv'
	skip_before_filter  :verify_authenticity_token

	def index
	end

  def create
  	cvs_upload = CsvUpload.new
  	cvs_upload.file = url_params
    cvs_upload.save!
    ic = Iconv.new("utf-8", "big5")
    csv_text = params[:data_file].tempfile
    csv = CSV.parse(csv_text, :headers => true)
    ary = Array.new
    null_product = Array.new
    guid_product = Array.new
    csv.each do |item|
      p ic.iconv(item[0])
      p "0000"
      cn = 0
      item.each_with_index { |d,i| cn -= 1 if item[i] == ( "" and nil)} 
      cp = FProduct.find_by_id(item[1].to_i) 
      if cn == 0 && cp.present?
      	check_product = FetProductUrl.find_by_guid(item[1].to_i)
      	check_product.destroy if check_product.present?
      	product_url = FetProductUrl.new
      	product_url.name = ic.iconv(item[0].to_s)
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
      	ary << ic.iconv(item[0].to_s)
      else
        null_product << ic.iconv(item[0].to_s) if cn != 0
        guid_product << ic.iconv(item[0].to_s) if cp.blank?
      end
    end
    @product_info = ary
    @null_product = null_product
    @guid_product = guid_product

    render :action => "index"
  end
  def url_params
    params.require(:data_file)
  end

end
