class DogsController < ApplicationController



    def index

        @dogs = Dog.sort_by_employees
        # @dogs = Dog.all
    end

    def show
        @dog = Dog.find(params[:id])
    end

end
