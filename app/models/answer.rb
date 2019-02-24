class Answer < ApplicationRecord
  belongs_to :question
  has_many :results, dependent: :destroy
end
