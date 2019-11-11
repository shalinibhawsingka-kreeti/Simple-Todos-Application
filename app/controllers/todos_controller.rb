class TodosController < ApplicationController
  before_action :get_todo, only: %i[show edit update destroy]
  before_action :authenticate

  def index
    @user = current_user
    @todos = Todo.all.where(user_id: @user.id)
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to @todo
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @todo.update(todo_params)
      redirect_to @todo
    else
      render 'edit'
    end
  end

  def destroy
    redirect_to todos_path if @todo.destroy
  end

  def generate
    @user = current_user
    @todos_completed = @user.todos.all.order_by_date.completed
    @todos_not_completed = @user.todos.all.order_by_date.not_completed
  end

  def filter
    @user = current_user
    @todos = Todo.all.where(user_id: @user.id)
    @todo_dates = Todo.all.where(date: params[:date]).rewhere(user_id: @user.id) if params[:date]
  end

  private

  def todo_params
    params.require(:todo).permit(:desc, :date, :status, :user_id)
  end

  def get_todo
    @todo = Todo.find(params[:id])
  end
end
