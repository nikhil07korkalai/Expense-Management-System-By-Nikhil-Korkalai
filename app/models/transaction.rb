class Transaction < ActiveRecord::Base
	belongs_to :iteration, polymorphic: true
	def get_income
		if self.transaction_through_type == 'Income'
           eval(transaction_through_type).find(transaction_through_id).income_category.income_source
        else
           eval(transaction_through_type).find(transaction_through_id).expense_category.expense_source
		end
	end	

	def get_expense
		eval(transaction_through_type).find(transaction_through_id).expense_category.expense_source
	end	
    
    def get_amount
		if self.transaction_through_type == 'Income'
          eval(transaction_through_type).find(transaction_through_id)
        else
           eval(transaction_through_type).find(transaction_through_id)
		end
	end	
end
