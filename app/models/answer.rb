class Answer < ApplicationRecord
  belongs_to :question
  has_many :results, dependent: :destroy

  scope :true, ->{where "correct_answer = true"}
end
