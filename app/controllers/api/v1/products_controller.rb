class Api::V1::ProductsController < ActionController::Base
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # # 動作確認用にCSRFを無効化しています
  # skip_before_action :verify_authenticity_token

  # GET /api/v1/products
  def index
    render json: Product.all
  end

  # GET /api/v1/products/1
  def show
    render json: ProductResource.new(Product.find(params[:id]))
  end

  # POST /api/v1/products
  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/products/1
  def destroy
    @product.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :age)
    end
end
