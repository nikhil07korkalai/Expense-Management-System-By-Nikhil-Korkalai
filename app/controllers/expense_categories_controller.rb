class ExpenseCategoriesController < ApplicationController
  before_action :require_user
  before_action :set_expense_category, only: [:show, :edit, :update, :destroy]
  

  def index
     @expense_categories = ExpenseCategory.where(user_reference: current_user)
  end

  def new
    @expense_category = ExpenseCategory.new
  end

  def create
    @expense_category = ExpenseCategory.new(assign_params.merge!({:user_reference => current_user.id}))  
    if @expense_category.save  
        flash[:notice] = "Expense Category Generated Successfully." 
        redirect_to  @expense_category  
    else  
        render :action => 'new'  
    end
  end

  def show
      @expense_category = ExpenseCategory.find(set_expense_category)
  end

  def edit
  end

  def update
   if @expense_category.update(assign_params)
     redirect_to expense_categories_path
   end 
  end

  def destroy 
  end

  private
  def set_expense_category
    @expense_category = ExpenseCategory.find(params[:id])
  end

  def assign_params
    params.require(:expense_category).permit(:expense_source,:desc)
  end
end

