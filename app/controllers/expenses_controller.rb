class ExpensesController < ApplicationController
  before_action :require_user
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  

  def index
     @expenses = Expense.where(user_reference: current_user)
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(assign_params.merge!({:user_reference => current_user.id})) 
    if @expense.save  
      @expense_record = Expense.last
      @transaction = Transaction.new(transaction_through_type: 'Expense', transaction_through_id: @expense_record.id, date: @expense_record.date, user_reference: current_user.id) 
      if @transaction.save
        flash[:notice] = "Expense Generated Successfully." 
        redirect_to  @expense  
      end   
    else  
        render :action => 'new'  
    end
  end

  def show
      @expense = Expense.find(set_expense)
  end

  def edit
  end

  def update
  end

  def destroy
   if @expense.destroy
     redirect_to expenses_path
   end  
  end

  private
  def set_expense
    @expense = Expense.find(params[:id])
  end

  def assign_params
    params.require(:expense).permit(:category, :amount, :date)
  end
 
end

