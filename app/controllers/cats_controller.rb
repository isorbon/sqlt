class CatsController < ApplicationController
  before_action :set_cat, only: [:edit, :update, :destroy]
  before_action :erse_
  def show
    @cat=Cat.new
  end

  def edit
  end

  def create
    @cat = Cat.new(category_params)
    respond_to do |format|
      if @cat.save
        format.html { redirect_to cy_path }
      else
        format.html { render :show }
      end
    end
  end

  def update
    respond_to do |format|
      if @cat.update(category_params)
        format.html { redirect_to cy_path }
      else
        format.html { render :edit  }
      end
    end
  end



  def destroy
    ers
    @cat.destroy
    respond_to do |format|
      format.html { redirect_to cy_path, notice: 'Удалено' }
    end
  end


  private
   def category_params
      return params.require(:cat).permit(:name)
   end

  def set_cat
    @cat = Cat.find(dec(params[:id]).to_i)
    if @cat==false
      redirect_to  errors_path
    end
  end



end







