class User < ActiveRecord::Base
	#acts_as_authentic
	validates :name,presence: true
	validates :email, presence: true
	validates :password, presence: true

	has_many :income_categories
	has_many :incomes
	has_many :expense_categories
	has_many :expenses

	acts_as_authentic do |c|
		c.login_field = 'email'
	end
end
