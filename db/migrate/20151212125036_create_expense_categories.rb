class CreateExpenseCategories < ActiveRecord::Migration
  def change
    create_table :expense_categories do |t|
      t.string :expense_source
      t.string :desc
      t.integer :user_reference

      t.timestamps null: false
    end
  end
end
