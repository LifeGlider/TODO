class Task < ApplicationRecord
  validates :todo, presence: true
  validates_inclusion_of :done, :important, in: [true, false]
  validates_length_of :todo, :maximum => 300
end
