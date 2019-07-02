class Respond < ApplicationRecord
  belongs_to :user
  has_many :results, dependent: :destroy
  accepts_nested_attributes_for :results, allow_destroy: true, reject_if: proc {|attr| attr[:user_id].blank?}
end
