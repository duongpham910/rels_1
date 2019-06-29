class Question < ApplicationRecord
  belongs_to :exam
  has_many :answers, dependent: :destroy, inverse_of: :question, autosave: true

  accepts_nested_attributes_for :answers, allow_destroy: true,
    reject_if: proc {|attributes| attributes[:content].blank?}
end
