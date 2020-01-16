class TasksController < ApplicationController
  before_action :set_params, only: [:edit, :show, :update, :destroy]

  def index
    @tasks = Task.all.recent
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save
    redirect_to tasks_path
  end

  def show
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:name, :description, :start, :end)
  end

  def set_params
    @task = Task.find(params[:id])
  end
end
