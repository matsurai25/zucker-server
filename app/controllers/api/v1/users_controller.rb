class Api::V1::UsersController < ActionController::Base
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # # 動作確認用にCSRFを無効化しています
  # skip_before_action :verify_authenticity_token

  # GET /api/v1/users
  def index
    render json: User.all
  end

  # GET /api/v1/users/1
  def show
    render json: UserResource.new(User.find(params[:id]))
  end

  # POST /api/v1/users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/1
  def destroy
    @user.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :age)
    end
end
