class GroupsController < ApplicationController
  before_action :set_group, except: [:new, :create, :update]

  def new
    @group = Group.new
    @users = User.all
  end

  def create
    group = Group.new(create_params)

    if group.save
      redirect_to action: :show, id: group.id
    else
      render :new, inline: group.errors.full_messages[0]
    end
  end

  def edit
    @users = User.all
  end

  def update
    group = Group.new(create_params)

    if group.save
      redirect_to action: :show, id: group.id
    else
      render :edit, inline: group.errors.full_messages[0]
    end
  end

  def show
    @groups = Group.all
    @users = @groups.find(params[:id]).users
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def create_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
