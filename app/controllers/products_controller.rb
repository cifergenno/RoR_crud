require 'httparty'
class ProductsController < ApplicationController
  include HTTParty
    def index
      responce = HTTParty.get('http://localhost:3000/products')
      @products=JSON.parse(responce.body)
    end
  
    def new
      @product = Product.new
    end
  
    def create
      puts "uuuuuuuuuuuuuuuuuuuuuuuu"
      data = params["product"]
      puts "uuuuuuuuuuuuuuuuuuuuuuuu"

      url = 'http://localhost:3000/products/'
      data = { "product":{
        "name": data["name"],
        "description": data["description"],
        "price": data["price"],
        } }
        
      @product = HTTParty.post(url, body: data)
      @product=JSON.parse(@product.body)
        if @product["status"].eql? "Success"
          redirect_to products_path
        else
          render :new
        end

    end

    def view
        @product = HTTParty.get('http://localhost:3000/products/'+params[:id])
        @product=JSON.parse(@product.body)
    end
    
    def edit
        @product = HTTParty.get('http://localhost:3000/products/'+params[:id])
        @product=JSON.parse(@product.body)
    end
  
    def update
      url = 'http://localhost:3000/products/'+params[:id]
      data = { "product":{
        "name": params[:name],
        "description": params[:description],
        "price": params[:price],
        } }

      @product = HTTParty.put(url, body: data)
      @product=JSON.parse(@product.body)
        if @product["status"].eql? "Success"
          redirect_to products_path
        else
          render :edit
        end
    end
  
    def destroy
      @product = HTTParty.delete('http://localhost:3000/products/'+params[:id])
      @product=JSON.parse(@product.body)
      redirect_to products_path
    end
  
    private
      def product_params
        params.require(:product).permit(:name, :description, :price)
      end
  end
  