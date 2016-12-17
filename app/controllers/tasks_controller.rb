class TasksController < ApplicationController
  before_action :set_tasks, only: [:edit,:destroy,:update]
  before_action :erse_
  def new
    @task=Task.new
  end

  def show
    @tasks=Task.select("users.fname as uf,users.lname as ul, cats.name as name,cats.id as cat_id,tasks.id as id,tasks.ask as ask,tasks.answer as answer,tasks.mark as mark,tasks.time as time").joins(:cat,:user).paginate(page: params[:page], per_page: 10) rescue nil?
    if @tasks == false
      redirect_to errors_path
    end
  end

  def edit

  end

  def create

    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to tl_path }
      else
        format.html { render :new }
      end
    end
  end

  def update

      respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tl_path }
      else
        format.html { render :edit  }
      end
    end
  end


  def destroy

    @task.destroy
    respond_to do |format|
      format.html { redirect_to tl_path}
    end
  end

  private
  def set_tasks
    @task =Task.find(dec(params[:id]).to_i) rescue nil?
       if @task ==false
         redirect_to  errors_path
       end
  end
    def task_params
      sgh=params.require(:task).permit(:ask,:answer,:mark,:cat_id,:time)
      return {ask: sgh[:ask],answer:sgh[:answer],mark: sgh[:mark],cat_id: sgh[:cat_id],user_id: current_user[:id],time: sgh[:time]}
    end
end
