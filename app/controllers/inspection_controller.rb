class InspectionController < ApplicationController
  before_action :set_t, only: [:show,:create]
  before_action :set_dest, only: [:destroy]
  before_action :erse_oll
  before_action :set_task_select, only: [:response_]

  def show
    @check=Tu.where("test_id = #{@test.id.to_i} and user_id = #{current_user[:id].to_i} and onload = true").length rescue nil?
    if @check >0
      redirect_to im_path
    else
      @start_test=tes
    end
  end
  def response_
     @res=Basic.connection.exec_query(set_task_select) rescue nil?
  end
  def destroy
    set_dest
        respond_to do |format|
        format.html { redirect_to admin_path }
      end
  end
  def create
      session[:mark]=0
    if inspection_params
      session[:onload]=true
      @student=Tu.new({test_id: @test.id,user_id:current_user[:id],onload: session[:onload],option:session[:option],mark:session[:mark]}) rescue nil?
      @student.save
      redirect_to im_path
    else
      redirect_to home_path
    end
  end
  private

  def set_dest
    @dest = Tu.where("test_id=#{dec(params[:test]).to_i} and user_id=#{dec(params[:user]).to_i}").destroy_all rescue nil?
    @dest2 = Inspection.where("test_id=#{dec(params[:test]).to_i} and user_id=#{dec(params[:user]).to_i}").destroy_all rescue nil?
    if @dest ==false &&@dest2==false
      redirect_to errors_path
    end
  end
  def set_t
    @test = Test.find(dec(params[:test_name]).to_i) rescue nil?
    if @test ==false
      redirect_to errors_path
    end
  end
  def tes
    return Tpublic.joins(:task).where("tpublics.option = #{session[:option]} and test_id=#{@test.id}") rescue nil?
  end
  def inspection_params
        params.dup.each { |x|
        if x.index('id')
          if check(select_answer(x[/\d+/].to_i)[:answer],params[x]) ==true
              session[:mark]+=select_answer(x[/\d+/].to_i)[:mark]
            @inspection=Inspection.new({task_id:x[/\d+/].to_i,user_id:current_user[:id],test_id:dec(params[:test_name]).to_i,answer:params[x],mark:select_answer(x[/\d+/].to_i)[:mark]}).save
          else
            @inspection=Inspection.new({task_id:x[/\d+/].to_i,user_id:current_user[:id],test_id:dec(params[:test_name]).to_i,answer:params[x],mark:0}).save
          end
        end
      }
  end
  def set_task_select
    if params[:query].to_i !=0
      return Task.find(params[:query].to_i)[:answer] rescue nil?
    else
      return params[:query]
    end
  end
  def select_answer(id)
      return Task.find(id) rescue nil?
  end
    def check(author_query,user_query)
      br1=Basic.connection.exec_query(user_query) rescue nil?
      br2=Basic.connection.exec_query(author_query) rescue nil?
        if br1!=false && br2 !=false
          if br1.columns ==br2.columns &&br1.rows==br2.rows
            sq1=Shadow.connection.exec_query(user_query) rescue nil?
            sq2=Shadow.connection.exec_query(author_query) rescue nil?
            if sq1!=false && sq2 !=false
              if sq1.columns ==sq2.columns &&sq1.rows==sq2.rows
                return true
              else
                return false
              end
            end
          else
            return false
          end
        end
    end
end