class TasksController < ApplicationController
  before_action :set_params, only: [:edit, :show, :update, :destroy]

  def index
    @tasks = current_user.tasks.includes(:user).recent
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
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
    params.require(:task).permit(:name, :description, :start_time, :end_time).merge(user_id: current_user.id)
  end

  def set_params
    @task = current_user.tasks.find(params[:id])
  end
end
