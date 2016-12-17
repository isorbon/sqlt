class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id]) rescue nil?
  end
  private
  def encrypt(str)
    if  str.nil? == false
      temp=Digest::SHA1.hexdigest str.reverse+(Digest::SHA1.hexdigest str)
      return Digest::SHA1.hexdigest (temp.reverse+str)
    end
  end

  def dec(text)
    if text.nil? == false &&text.length>100
      crypt = ActiveSupport::MessageEncryptor.new('b23a276ce11227f08e802005da3161a57c8107fad9e310cc1b2c83c2cd477be114fe74ebef87686de03068b23a276ce11227f08e802005da3161a57')
      return  crypt.decrypt_and_verify(text)
    end
  end
  def erse_
    if current_user==nil
      redirect_to '/errors'
    elsif current_user[:status_user]!=1
      redirect_to '/errors'
    end
  end
  def erse_oll
    if current_user==nil
      redirect_to '/errors'
    end
  end

end



