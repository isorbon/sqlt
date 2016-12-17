class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_login(session_params[:login]) rescue nil?
  if user != false && authenticate(session_params[:login],session_params[:password])
      session[:user_id] = user.id
      session[:status_user] = user.status_user
      if user.status_user== 0
        redirect_to im_path
      else
        redirect_to block_path
      end
    else
      render 'new'
    end
  end
  def destroy
        session[:user_id]=nil
        session[:status_user] =nil
        redirect_to root_path
  end
  private
    def session_params
    sgh= params.permit(:login,:password)
    return {login: sgh[:login],password:encrypt(sgh[:password])}
  end
  def authenticate(login, password)
    user = User.find_by_login(login)
    if user && user[:password] == password
      user
    else
      nil
    end
  end
end
