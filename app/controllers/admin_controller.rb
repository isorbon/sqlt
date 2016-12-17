class AdminController < ApplicationController
before_action :set_statistic, only: [:statistic]
before_action :set_fstatistic, only: [:full_statistic]
before_action :erse_
    def show
      @statistic=Test.all
    end
    def statistic
    end
    def full_statistic
    end
    def edit
    end
private
    def set_statistic
      @statistic=Inspection.all.where("test_id = #{params[:t_name].to_i} and user_id = #{params[:u_name].to_i}") rescue nil?
      if @statistic ==false
        redirect_to errors_path
      end
    end
    def set_fstatistic
      @f_statistic=Tu.where("test_id=#{params[:t_name]}") rescue nil?
      if@f_statistic== false
        redirect_to errors_path
      end
    end
end
