class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :show_image]
  before_action :set_branch, only: :index

  # GET /products
  # GET /products.json
  def index
    @products = Product.search_product(params[:search] || {})
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.image = product_params[:image].read if product_params[:image].present?

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def show_image
    send_data @product.image, type: "image/png", disposition: "inline"
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        if product_params[:image].present?
          @product.image = product_params[:image].read
          @product.save
        end
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.fetch(:product).permit(:name, :price, :details, :branch_id, :category_id, :image, :available)
    end

    def set_branch
      params[:search] = params[:search] || {}
      params[:search][:branch_id] = current_user.branch_id if current_user.branch_manager?
    end
end
