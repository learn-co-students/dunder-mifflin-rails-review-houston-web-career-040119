class Employee < ApplicationRecord
  belongs_to :dog

  validates :alias, uniqueness: true
  validates :title, uniqueness: true

  def name
    "#{self.first_name} #{self.last_name}"
  end

end
