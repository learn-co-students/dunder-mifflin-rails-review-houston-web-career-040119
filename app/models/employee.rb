class Employee < ApplicationRecord
    belongs_to :dog

    def full_name
        self.first_name + ' ' + self.last_name
    end

    validates :alias, presence: true, uniqueness: true
    validates :title, presence: true, uniqueness: true
    
end
