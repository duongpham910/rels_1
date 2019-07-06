class AddRespondIdForResult < ActiveRecord::Migration[5.2]
  def change
    change_table :results do |t|
      t.references :respond, foreign_key: true
    end
  end
end
