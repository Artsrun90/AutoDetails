class ProductsController < ApplicationController
    APIKEY = ENV['API_KEY']
    
    def index
        client = Rest.new(APIKEY)
        res_by_oem = client.get_brands_by_oem(params[:search])
        @brands = res_by_oem['data'].map{|hash| hash['brand']}
        @query = params[:search]
        get_product_by_brand(client, params[:search], @brands.first)
    end

    def by_brand
        client = Rest.new(APIKEY)
        product = get_product_by_brand(client, params[:oem], params[:brand])
        if product
            return render :json => {status: 200, :product => product}           
        else
            return render :json => {status: 404, :message => "Product not found."}            
        end
    end    

    private

    def get_product_by_brand(client, oem, brand)
        product = client.get_by_brand_and_oem(oem, brand)
        @product = product['data'] ? product['data'].first : nil
    end    
end