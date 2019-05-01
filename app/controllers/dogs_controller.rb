class DogsController < ApplicationController
    def index
        @dogs = Dog.all.sort_by { |dog| dog.employees.uniq.count }
    end

    def show
        @dog = Dog.find(params[:id])
        @employees = @dog.employees.uniq
    end
end
