class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.where(user_reference: current_user)
  end
end
