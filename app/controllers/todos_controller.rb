class TodosController < ApplicationController
    before_action :logged_in_user
    before_action :correct_user,   only: [:edit, :update]

    def index
        @todos = current_user.todos.paginate(page: params[:page])
    end

    def show
        @todo = current_user.todos.find(params[:id])
    end

    def new
        @todo = current_user.todos.build
    end

    def create
        @todo = current_user.todos.build(todo_params)
        if @todo.save
            flash[:success] = "TODO追加成功"
            redirect_to todos_path
        else
            render 'new'
        end
    end

    def edit
        @todo = current_user.todos.find(params[:id])
    end

    def update
        @todo = current_user.todos.find(params[:id])
        if @todo.update_attributes(todo_params)
            flash[:success] = "更新成功"
            redirect_to todos_path
        else
            render 'edit'
        end
    end

    def destroy
        @todo.destroy
        flash[:success] = "削除成功"
        redirect_to todos_path
    end

    private
        def todo_params
            params.require(:todo).permit(:title, :content, :by_time)
        end

        def correct_user
            @todo = current_user.todos.find_by(id: params[:id])
            redirect_to todo_path if @todo.nil?
        end
end
