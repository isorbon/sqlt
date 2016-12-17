class TestsController < ApplicationController
  before_action :set_tst, only: [:edit,:destroy,:update]
  before_action :auth, only: [:block,:password_c]
  before_action :erse_ ,only: [:edit,:destroy,:update,:new,:show]
  before_action :erse_oll, only: [:block,:password_c]
  def new
    @tests=Test.new
  end
  def show
    if params[:page].nil? ==true
      @tests=Test.paginate(page: params[:page], per_page: 10)
    elsif params[:page].to_i !=0
      @tests=Test.paginate(page: params[:page].to_i, per_page: 10)
    else
      redirect_to home_path
    end
  end

  def edit

  end

  def create

    @tests = Test.new(test_params)
    respond_to do |format|
      if @tests.save
        format.html { redirect_to tsl_path }
      else
        format.html { render :new }
      end
    end
  end

  def destroy

    @test.destroy
    respond_to do |format|
      format.html { redirect_to tsl_path, notice: 'Удалено' }
      format.json { head :no_content }
    end
  end

  def update

      respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to tsl_path }
      else
        format.html { render :edit  }
      end
    end
  end
  def password_c
    if  encrypt(params.require(:test).permit([:password])[:password])==@test.password
      redirect_to start_path(params[:test_name]), :popup => true
    else
      redirect_to im_path;
    end
  end
  def block
    session[:option]=option
    session[:start_t]=Time.now.to_i
    session[:end_t]=session[:start_t]+(Tpublic.joins(:task).where("tpublics.option = #{session[:option]} and test_id=#{@test.id}").sum("tasks.time")).to_i
  end

  private

  def option
    ou=[]
    to=Tpublic.select(:option).distinct.where("test_id=#{@test.id}")
    to.each { |x|  ou.append(x.option)}
    return ou.sample
  end
  def set_tst
    @test = Test.find(dec(params[:id]).to_i) rescue nil?
      if @test == false
        redirect_to errors_path;
      end
  end

  def auth
    @test = Test.find(dec(params[:test_name]).to_i) rescue nil?
    if @test == false
      redirect_to errors_path;
    end
  end

  def test_params
    sgh= params.require(:test).permit(:description,:name,:start_t,:password,:active)
    return {description:sgh[:description],name:sgh[:name],start_t:sgh[:start_t],password: encrypt(sgh[:password]),active: sgh[:active]}
  end
end


