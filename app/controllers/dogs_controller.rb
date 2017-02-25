class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  def index
    @dogs = Dog.with_playdates(current_user.id)
  end

  def all_dogs 
    @dogs = Dog.all
  end 

  def show
  end

  def new
    @dog = current_user.dogs.new
  end

  def create
    @dog = current_user.dogs.new(dog_params)
    if @dog.save 
      flash[:success] = 'You Added A New Pup!'
      redirect_to dog_path(@dog)
    else 
      render :new
    end
  end 

  def edit
  end

  def update
    if @dog.update(dog_params)
      flash[:success] = 'You Updated Your Dogs Information!'
      redirect_to dog_path(@dog)
    else 
      render :edit
    end
  end 

  def destroy 
    @dog.destroy 
    flash[:success] = "You Deleted Your Dog"
    redirect_to :root
  end 

  private 

  def set_dog
    @dog = Dog.find(params[:id])
  end 

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :gender, :description)
  end 
end
