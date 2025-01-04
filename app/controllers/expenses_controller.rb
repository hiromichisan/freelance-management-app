class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expense, only: %i[show edit update destroy]

  def index
    @expenses = current_user.expenses
  end

  def new
    @expense = current_user.expenses.new
  end

  def create
    @expense = current_user.expenses.new(expense_params)
    if @expense.save
      redirect_to expenses_path, notice: "Expense was successfully added."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @expense.update(expense_params)
      redirect_to expenses_path, notice: "Expense was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @expense.destroy
    redirect_to expenses_path, notice: "Expense was successfully deleted."
  end

  private

  def set_expense
    @expense = current_user.expenses.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:description, :amount, :category)
  end
end
