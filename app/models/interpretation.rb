class Interpretation < ApplicationRecord
  belongs_to :dream

  validates :description, presence: true
  validates :date, presence: true
  validates :quality, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :hours, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  serialize :tags, Array
end
