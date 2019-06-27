class Exam < ApplicationRecord
  belongs_to :subject
  has_many :questions, dependent: :destroy, inverse_of: :exam, autosave: true
  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: proc {|attributes| attributes[:content].blank?}
  has_many :results
end
