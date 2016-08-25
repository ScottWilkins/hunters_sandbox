class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def hunt
    if params[:search_term]
      search_term = params[:search_term]
      @searching = true;
      term =  "%#{search_term.downcase}%"
      @products = Product.unclaimed.where("LOWER(name) LIKE ? OR LOWER(description) LIKE ?", term, term)
    end
  end

  def sell

  end

  def edit

  end

  def feed

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end

end
