class CommentsController < ApplicationController

    def show
        @comment = Comment.new
        task = Task.find(params[:id])
        comments = Comment.all

        @contents = []
        comments.each {|i| @contents.push(i) if i.task_id == task.id }
    end
        
end
