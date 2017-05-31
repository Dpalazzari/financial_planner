class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.integer :cost
      t.date :due_date
      t.string :details
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
