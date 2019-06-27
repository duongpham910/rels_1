class Exam < ApplicationRecord
  belongs_to :subject
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
end
