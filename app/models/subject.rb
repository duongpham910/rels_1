class Subject < ApplicationRecord
  has_many :exams, dependent: :destroy
end
