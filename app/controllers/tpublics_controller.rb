class TpublicsController < ApplicationController
  before_action :erse_
  def new

  end
  def create

   if  option
      redirect_to admin_path
   else
     render 'new'
    end
  end

  private

  def option
    taskid=id_task
    $p=0
    (1..params[:count].to_i).each do |i|
      (1..@count_z).each do |j|
        @tes1=Tpublic.new({task_id: taskid[$p] ,test_id: params[:tid], option: i})
        @tes1.save
        $p=$p+1
      end
    end
    return true
  end

  def id_task
    out=[]
    $j=0
    while $j<params[:count].to_i
      out.push(id_t)
      $j=$j+1
    end
    out=out.join(',').split(',')
    out=out.collect{|k| k.to_i}
    return out
  end

  def get_(id,k) # получение случайных задании по котегориям
    tl=[]
    tp=Task.joins(:cat).select(:id).group("tasks.id,cats.id").where("cats.id=#{id}")
    tp.each do |ids|
      tl.push(ids.id)
    end
    return tl.sample(k)
  end

  def id_t # получение категории и знаяения
    @count_z=0
    out=[]
     tp=Cat.joins(:tasks).select('cats.id as cats_id,cats.name as cats_name,count(tasks.id)as count_task_id').group('cats.name')
      tp.each do |cat|
        out.append(get_(cat.cats_id,params["cat#{cat.cats_id}"].to_i))
        @count_z+=params["cat#{cat.cats_id}"].to_i
      end
      return out
  end
end











