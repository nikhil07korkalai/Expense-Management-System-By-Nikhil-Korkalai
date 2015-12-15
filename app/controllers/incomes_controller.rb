class IncomesController < ApplicationController
  before_action :require_user
  before_action :set_income, only: [:show, :edit, :update, :destroy]
  
  require 'date'

  def index
     @incomes = Income.where(user_reference: current_user)
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(assign_params.merge!({:user_reference => current_user.id}))  
    if @income.save
      @income_record = Income.last
      @transaction = Transaction.new(transaction_through_type: 'Income', transaction_through_id: @income_record.id, date: @income_record.date, user_reference: current_user.id) 
      if @transaction.save
        flash[:notice] = "Income Generated Successfully." 
        redirect_to @income 
      end  
    else  
        render :action => 'new'  
    end
  end

  def show
      @income = Income.find(set_income)
  end

  def edit
    @income = Income.find(set_income)
  end

  def update
    if @income.update(assign_params)  
      flash[:notice] = "Successfully updated profile."  
      redirect_to incomes_path  
    else  
      render :action => 'edit'  
    end  
  end

  def destroy
  end

  private
  def set_income
    @income = Income.find(params[:id])
  end

  def assign_params
    params.require(:income).permit(:category,:amount,:date)
  end
  
end
