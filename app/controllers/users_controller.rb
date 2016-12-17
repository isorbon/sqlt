class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :erse_oll ,only:[:marks,:show,:update,:new]
  def marks
    @marks=Tu.where("tus.user_id=#{current_user[:id]}") rescue nil?
  end
  def show
    @test=Test.select(:id,:name,:description,:start_t).where("tests.active = true").having("tests.id not in  (SELECT test_id FROM tus WHERE user_id= #{current_user[:id].to_i})").order("tests.start_t DESC;") rescue nil?
  end
  def persons
    erse_
    if params[:page].nil? ==true
      @users=User.paginate(page: params[:page], per_page: 20)
    elsif params[:page].to_i !=0
      @users=User.paginate(page: params[:page].to_i, per_page: 20)
    else
      redirect_to home_path
    end
  end

  def new
    @user = User.new
  end

  def destroy
    erse_
    @user.destroy
    respond_to do |format|
      format.html { redirect_to sh_path, notice: 'Удалено' }
      format.json { head :no_content }
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to signin_path }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to im_path}
      else
        format.html { render :edit  }
      end
    end
  end
  def set_user
    @user = User.find(dec(params[:id]).to_i) rescue nil?
    if @user ==false
      redirect_to  errors_path
    end
  end
  private


  def user_params
    sgh=params.require(:user).permit(:fname, :lname, :login, :password, :secret, :img)
    if @user!=nil
      if @user[:status_user]==1
        return {fname: sgh[:fname],lname: sgh[:lname],login: sgh[:login],password:encrypt(sgh[:password]),img: sgh[:img],secret:encrypt(sgh[:password].reverse.swapcase),status_user:1}
      elsif @user[:status_user]==0
        return {fname: sgh[:fname],lname: sgh[:lname],login: sgh[:login],password:encrypt(sgh[:password]),img: sgh[:img],status_user:0}
      end
    else
      return {fname: sgh[:fname],lname: sgh[:lname],login: sgh[:login],password:encrypt(sgh[:password]),img: sgh[:img],status_user:0}
    end
  end
end

