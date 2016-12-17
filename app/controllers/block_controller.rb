class BlockController < ApplicationController
  def show
    erse_
  end
  def create
    erse_oll
    @uses = User.find_by_secret(sj_params[:secret]) rescue nil?
    if  @uses&& current_user[:status_user]==1
      redirect_to admin_path
    elsif @uses==false
      session[:user_id]=nil
      session[:status_user]=nil
      redirect_to signin_path
    end
  end
  private
  def sj_params
    sgh= params.permit(:secret)
    return {secret:encrypt(sgh[:secret])}
  end
end
