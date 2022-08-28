class TaskListsController < ApplicationController
  
  def index
    # form-tagのmodel名と揃える必要がある
    @task_list = TaskList.new
    @lists = TaskList.all
  end
  
  def create
    @list = TaskList.new(task_list_params)
    
    if @list.save
      redirect_to task_lists_path
    else
      render 'index'
    end
  end
  
  def show
    @task = Task.new
    @list = TaskList.find(params[:id])
    tasks = Task.all
    
    # false true　それぞれの空配列を作る
    @task_false = []
    @task_true = []
    
    # false true それぞれ条件に合うものに入れ込む
    tasks.each {|task| @task_false.push(task) if task.status == false && task.task_list_id == @list.id }
    tasks.each {|task| @task_true.push(task) if task.status == true && task.task_list_id == @list.id }
  end
  
  private
    
    def task_list_params
      params.require(:task_list).permit(:content)
    end
  
  
end
