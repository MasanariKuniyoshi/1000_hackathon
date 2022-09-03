class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    tasks = Task.all
    
     # false true　それぞれの空配列を作る
    @task_false = []
    @task_true = []
    
    # false true それぞれ条件に合うものに入れ込む
    tasks.each {|task| @task_false.push(task) if task.status == false }
    tasks.each {|task| @task_true.push(task) if task.status == true }
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success ] = "Welcome to your Task list!"
      redirect_to task_lists_path
    else
      render 'new'
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                     :password_confirmation)
    end
  
end
