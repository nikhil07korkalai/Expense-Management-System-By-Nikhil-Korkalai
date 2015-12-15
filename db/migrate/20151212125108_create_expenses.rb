class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :user_reference
      t.integer :category
      t.float :amount
      t.date :date

      t.timestamps null: false
    end
  end
end
