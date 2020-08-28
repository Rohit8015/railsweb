class Course < ApplicationRecord
    has_many :enrollments
    has_many :students, through: :enrollments
    validates :name, presence: true
    validates :name, uniqueness: true
end
