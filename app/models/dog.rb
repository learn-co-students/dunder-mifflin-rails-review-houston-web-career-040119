class Dog < ApplicationRecord
    has_many :employees

    def self.sort_by_employees
        dogs = self.all

        dogs.sort_by do |dog|
            dog.employees.count
        end
    end
end
