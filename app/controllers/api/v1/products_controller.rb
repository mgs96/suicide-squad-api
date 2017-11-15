class Api::V1::ProductsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  
    def index
      @products = Product.all
      render json: @products
    end
    
    def show
      @products = Product.find(params[:id])
      render json: @products
    end
    
    def create
      @product = Product.create(product_params)
        render json: { product: @product }
    end
    
    def update
       @product = Product.find(params[:id])
       @product.update_attributes(product_params)
       render json: { product: @product}
    end
    
    def delete
        @product = Product.find(params[:id])
        @product.destroy
    end
    
    private
    def product_params
      params.require(:product).permit(:name, :price, :desc, :rating)
    end
end
