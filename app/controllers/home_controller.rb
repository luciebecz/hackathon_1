class HomeController < ApplicationController
  def index
    @dogs = current_user.dogs.all
    #@dogs = Dog.with_playdates(current_user.id)
  end 

 
end
