class Api::V1::ProductsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  
    def index
      @user = User.find(params[:id])
      @products = @user.products
      render json: @products
    end
    
    def show
      @products = Product.find(params[:id])
      render json: @products
    end
    
    def createg
      @user = User.find(product_params[:user_id])
      @product = @user.products.create(product_params.except(:user_id))
      render json: @product
    end
    
    def update
       @product = Product.find(params[:id])
       @product.update_attributes(product_params)
       render json: @product
    end
    
    def delete
        @product = Product.find(params[:id])
        @product.destroy
    end
    
    def global
      @products = Product.all
      render jsons: @products
    end
    
    private
    def product_params
      params.require(:product).permit(:name, :price, :desc, :rating, :user_id)
    end
end
