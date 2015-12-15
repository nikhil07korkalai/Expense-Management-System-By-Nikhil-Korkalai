class CreateIncomeCategories < ActiveRecord::Migration
  def change
    create_table :income_categories do |t|
      t.string :income_source
      t.string :desc
      t.integer :user_reference

      t.timestamps null: false
    end
  end
end
