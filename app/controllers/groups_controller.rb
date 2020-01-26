class GroupsController < ApplicationController
  before_action :set_params, only: [:edit, :update] 

  def new
    @group = Group.new
    @group.group_users.build
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to admin_users_path
    else
      render :edit 
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [] )
  end

  def set_params
    @group = Group.find(params[:id])
  end
end
