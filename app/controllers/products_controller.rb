class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
      
    if params[:seller_id].present?
      @seller = Seller.find_by(id: params[:seller_id])
      @products = @seller.products

    
    else
      @products = Product.all
    end
    

  end


  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    if current_seller != @product.seller
      redirect_to products_path, notice: "Recuerda: ¡Solo puedes editar tus productos!"
    end  
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.seller_id = session[:seller_id]
    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
     
        if @product.update(product_params.reject { |k| k["images"] })
          if product_params[:images].present?
            product_params[:images].each do |image|
              @product.images.attach(image)
          end
          
        end

        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def remove_image
    @product = Product.find(params[:id])
    @image = ActiveStorage::Attachment.find(params[:image_id])
    @image.destroy
    redirect_to  edit_product_path(@product)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :description, :currency, :price, images: [])
    end
end


