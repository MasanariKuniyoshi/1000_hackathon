class CommentsController < ApplicationController

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

    def update
        @comment = current_user.comments.find_by(id: params[:id])
        task_id = @comment.task.id

        @comment.update(content: params[:content])
        redirect_back fallback_location: task_path(task_id)
    end

    def destroy
        @comment = current_user.comments.find_by(id: params[:id])
        task_id = @comment.task.id

        @comment.destroy
        redirect_back fallback_location: task_path(task_id)
    end

    private
        def comment_params
            params.require(:comment).permit(:content)
        end
end
