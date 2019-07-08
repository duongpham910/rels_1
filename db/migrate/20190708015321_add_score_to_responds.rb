class AddScoreToResponds < ActiveRecord::Migration[5.2]
  def change
    add_column :responds, :score, :integer
  end
end
