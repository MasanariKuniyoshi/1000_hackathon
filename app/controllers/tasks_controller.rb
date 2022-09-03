class TasksController < ApplicationController
  
  def index
    @task = Task.new
    tasks = Task.all
    
    @task_false = []
    @task_true = []
    
    tasks.each {|task| @task_false.push(task) if task.status == false }
    tasks.each {|task| @task_true.push(task) if task.status == true }
  end
  
  def create
    @list = TaskList.find(params[:task][:id])
    @task = @list.tasks.build(task_params)

    if @task.save
      redirect_to task_list_path(@list.id)
    else
      render 'new'
    end
  end
  
  # def show
  #   tasks = Task.all
    
  #   # false true　それぞれを入れう空配列を作る
  #   @task_false = []
  #   @task_true = []
    
  #   # false true それぞれ条件に合うものに入れ込む
  #   tasks.each {|task| @task_false.push(task) if task.status == false }
  #   tasks.each {|task| @task_true.push(task) if task.status == true }
  # end
  
  def show
    @comment = Comment.new
    task = Task.find(params[:id])
    com = Comment.all

    # 指定の「task_id」持ちのコメント一覧を取得
    @comments = []
    com.each {|i| @comments.push(i) if i.task_id == task.id }
  end

  # taskのチェックボックスクリック時にステータスを変更
  def toggle
    @task = Task.find(params[:id])
    # task_list = @task.task_list_id
    
    # タスクstatusの値を反対に返す
    @task.status = !@task.status
    @task.save
    
    # render nothing: true
    # 上記のrenderはrails5から使えなくなったので下記の方法を利用
    redirect_to task_list_path(@task.task_list_id)

  end
  
    private
    
      def task_params
        params.require(:task).permit(:content)
      end
      
end