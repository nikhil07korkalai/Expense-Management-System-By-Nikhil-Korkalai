class IncomeCategoriesController < ApplicationController
  before_action :require_user
  before_action :set_income_category, only: [:show, :edit, :update, :destroy]
  require 'date'

  def index
     @income_categories = IncomeCategory.where(user_reference: current_user)
  end

  def new
    @income_category = IncomeCategory.new
  end

  def create
    @category = IncomeCategory.find_by(income_source: params[:income_source])
    if @category.present?
      flash[:notice] = "Income Category Already Generated!" 
    else
      @income_category = IncomeCategory.new(assign_params.merge!({:user_reference => current_user.id}))  
      if @income_category.save  
          flash[:notice] = "Income Category Generated Successfully!" 
          redirect_to  @income_category  
      else  
          render :action => 'new'  
      end
    end
  end

  def show
      @income_category = IncomeCategory.find(set_income_category)
  end

  def edit
  end

  def update
    if @income_category.update(assign_params)
     redirect_to income_categories_path
   end 
  end

  def destroy
  end

  private
  def set_income_category
    @income_category = IncomeCategory.find(params[:id])
  end

  def assign_params
    params.require(:income_category).permit(:income_source,:desc)
  end
end

