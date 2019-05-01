class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def show
    current_dog
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.create(dog_params)
    redirect_to @dog
  end

  def edit
    current_dog
  end

  def update
    current_dog
    @dog.update(dog_params)
    redirect_to @employee
  end

  private

  def current_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :age, :breed)
  end

end
