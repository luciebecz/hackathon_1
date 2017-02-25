class PlaydatesController < ApplicationController
  before_action :set_dog
  before_action :set_playdates, only: [:show, :edit, :update, :destroy]
  def show
    
  end

  def new
    @playdate = @dog.playdates.new
  end

  def create  
    @playdate = @dog.playdates.new(playdate_params)
    if @playdate.save 
      flash[:success] = 'Playdate Set!'
      redirect_to dog_playdate_path(@dog, @playdate)
    else 
      flash[:error] = @playdate.errors.full_messages.to_sentence
      render :new
    end 
  end 

  def edit
    
  end

  def update 
    if @playdate.update(playdate_params)
      flash[:success] = 'Playdate Updated'
      redirect_to dog_playdate_path(@dog, @playdate)
    else 
      render :edit 
    end 
  end 

  def destroy 
    @playdate.destroy 
    flash[:success] = 'Playdate Cancelled'
    redirect_to :root
  end 

  private 

  def playdate_params
    params.require(:playdate).permit(:location, :start_time, :end_time, :description)
  end 

  def set_dog 
    @dog = Dog.find(params[:dog_id])
  end 

  def set_playdates
    @playdate = @dog.playdates.find(params[:id])
  end 
end
