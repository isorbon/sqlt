class UsesController < ApplicationController
before_action :erse_ ,only:[:db_con,:update]
  def db_con
  end
  def ers
  end

  def update
      if use_param[:db_base].nil? !=true
        Basic.clear_all_connections!
        Basic.establish_connection(use_param[:db_base])
        temp=Basic.connection.execute("select 1+1") rescue nil?
        if temp== false
          render 'db_con'
        else
          Use.update(use_param)
          redirect_to admin_path
        end
      elsif use_param[:db_shadow].nil? !=true
          Shadow.clear_all_connections!
          Shadow.establish_connection(use_param[:db_shadow])
        temp=Shadow.connection.execute("select 1+1") rescue nil?
        if temp== false
          render 'db_con'
        else
          Use.update(use_param)
          redirect_to admin_path
        end
    end
  end
  private
    def use_param
      sgh= params.permit(:gemn,:user_name,:password,:host,:db,:dtp)
      if dec(sgh[:dtp])=='sj1'
        return {db_base: "#{sgh[:gemn]}://#{sgh[:user_name]}:#{sgh[:password]}@#{sgh[:host]}/#{sgh[:db]}"}
        elsif dec(sgh[:dtp])=='sj2'
        return {db_shadow: "#{sgh[:gemn]}://#{sgh[:user_name]}:#{sgh[:password]}@#{sgh[:host]}/#{sgh[:db]}"}
      else
          redirect_to  errors_path
      end
    end
end


