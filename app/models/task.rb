class Task < ApplicationRecord
  validates :todo, presence: true
  validates_length_of :todo, maximum: 300
  validates_with TaskValidator, on: :create
  validates_inclusion_of :done, :important, in: [true, false]
end
