class SkateboardsController < ApplicationController
  before_action :set_skateboard, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
  end

  def new
    @skateboard = Skateboard.new
  end

  def create
  @skateboard = current_user.skateboards.new(skateboard_params)

    respond_to do |format|
      if @skateboard.save
        format.html { redirect_to @skateboard, notice: 'skateboard was successfully created.' }
        format.json { render :show, status: :created, location: @skateboard }
      else
        format.html { render :new }
        format.json { render json: @skateboard.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def skateboard_params
    params.require(:skateboard).permit(:brand, :length, :model)
  end

end
