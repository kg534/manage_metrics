class TasksController < ApplicationController
  before_action :set_params, only: [:edit, :show, :update, :destroy]

  def index
    @today = Date.today
    tasks = current_user.tasks.includes(:user)
    @tasks_today = tasks.search_today.search_not_completed.recent
    @tasks_within = tasks.search_within.search_not_completed.recent
    @tasks_expired = tasks.search_expired.search_not_completed.recent
    @tasks_completed = tasks.search_completed.recent

    respond_to do |format|
      format.html
      format.csv { send_data tasks.generate_csv, filename: "task-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
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

  def destroy_all
    checked_data = params[:deletes].keys
    
    if Task.destroy(checked_data)
      redirect_to tasks_path
    else
      render action: 'index'
    end
  end

  def completed_all
    checked_data = params[:patches].keys
    
    if Task.where(id: checked_data).update_all(complete: true)
      redirect_to tasks_path
    else
      render action: 'index'
    end
  end

  private
  def task_params
    params.require(:task).permit(:name, :description, :start_time, :end_time, :complete).merge(user_id: current_user.id)
  end

  def set_params
    @task = current_user.tasks.find(params[:id])
  end
end
