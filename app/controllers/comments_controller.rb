class CommentsController < ApplicationController

    # def show
    #     @comment = Comment.new
    #     task = Task.find(params[:id])
    #     comments = Comment.all

    #     @contents = []
    #     comments.each {|i| @contents.push(i) if i.task_id == task.id }
    # end

    def create
        # ユーザーのログイン状態の判定
        if logged_in?
            # コメントの情報を取得、レコードの生成
            @task = Task.find(params[:comment][:id])
            @comment = @task.comments.build(comment_params)
            @comment.user_id = current_user.id
            
            # レコードの保存
            @comment.save
            redirect_to task_path(@task.id)
        else
            redirect_to login_path
        end
    end

    private
        def comment_params
            params.require(:comment).permit(:content)
        end
        
end
