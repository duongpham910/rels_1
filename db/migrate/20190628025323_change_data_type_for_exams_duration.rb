class ChangeDataTypeForExamsDuration < ActiveRecord::Migration[5.2]
  def change
    change_column :exams, :duration, :integer
  end
end
