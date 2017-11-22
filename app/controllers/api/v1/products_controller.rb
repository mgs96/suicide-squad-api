class Api::V1::ProductsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show, :global, :last_ten, :by_category ]
  
    def index
      @user = User.find(params[:user_id])
      @products = @user.products
    end
    
    def show
      @product = Product.find(params[:id])
    end
    
    def create
      @user = User.find(product_params[:user_id])
      @product = @user.products.create(product_params.except(:user_id, :category_name))
      @product.tags.create(category_id: Category.find_by(product_params[:category_name]).id)
      render 'show'
    end
    
    def update
      @product = Product.find(params[:id])
      @product.update_attributes(product_params)
      @product.tags.create(category_id: Category.find_by(product_params[:category_name]).id)
      render 'show'
    end
    
    def destroy
      @product = Product.find(params[:id])
      @product.destroy
    end
    
    def global
      @products = Product.all
      render 'index'
    end
    
    def last_ten
      @products = Product.order(created_at: :desc).limit(10)
      render 'index'
    end
    
    def by_category
      @products = Product.by_category(params[:category])
      render 'index'
    end
    
    private
    def product_params
      params.require(:product).permit(:name, :price, :desc, :rating, :user_id, :image, :category_name)
    end
end
