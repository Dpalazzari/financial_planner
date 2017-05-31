class ExpensesController < ApplicationController

  def create
    @user    = User.find(params[:user_id])
    @expense = @user.expenses.new(expense_params)
    if @expense.save
      flash[:info]  = "Successfully created an expense."
      redirect_to dashboard_path
    else
      flash[:danger] = "Make sure all required fields are filled in."
      redirect_to dashboard_path
    end
  end

  def destroy
    expense = Expense.find(params[:id])
    expense.destroy

    flash[:info] = "Removed expense."
    redirect_to dashboard_path
  end

  private

  def expense_params
    params.require(:expense).permit(:cost, :due_date, :details, :user_id)
  end
  
end