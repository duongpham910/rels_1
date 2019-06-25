class Exam < ApplicationRecord
  belongs_to :subject
  has_many :questions
  has_many :results
end
