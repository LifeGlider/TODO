class Task < ApplicationRecord
  validates :done, presence: true
  validates :todo, presence: true
  validates :important, presence: true
end
