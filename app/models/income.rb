class Income < ActiveRecord::Base
	belongs_to :user
  belongs_to :income_category, :class_name => "IncomeCategory", :foreign_key => 'category'
  has_many :transactions, as: :transaction
end
