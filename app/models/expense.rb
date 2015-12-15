class Expense < ActiveRecord::Base
	belongs_to :user
	belongs_to :expense_category, :class_name => "ExpenseCategory", :foreign_key => 'category'
	has_many :transactions, as: :transaction
end
