class Task < ApplicationRecord
  validates :todo, presence: true
  validates_inclusion_of :done, :important, in: [true, false]
end
