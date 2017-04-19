class ProductsController < ApplicationController
  def index
    #show all products
    @products = Product.all
  end

  def show
    #show one product
    @product = Product.find(params[:id])

    if current_user
      @review = @product.reviews.build
    end
  end

  def new
    #create a new product instance
    @product = Product.new
  end

  def edit
    #show fields of hte product you can change
    @product = Product.find(params[:id])
  end

  def create
    #create a new product instance and save it to the databse
    #when saved redirect to index, otherwise try again
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_url
    else
      render :new
    end
  end

  def update
    #update the params for the product
    #if successful redirect to individual product page, otherwise dont change anything
    @product = Product.find(params[:id])

    if @product.update_attributes(product_params)
      redirect_to product_url(@product)
    else
      render :edit
    end
  end

  def destroy
    #delete record for product
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url
  end

  private

  def product_params
    #define strong params for fields
    params.require(:product).permit(:name, :description, :price_in_cents)
  end
end
