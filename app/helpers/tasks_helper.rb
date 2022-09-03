module TasksHelper

    # タスクがある時true、ない時はfalseを返す
    def have_task?(task)
        !(task.empty?)
    end

end
