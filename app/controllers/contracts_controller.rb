class ContractsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contract, only: %i[show edit update destroy]

  def index
    @contracts = current_user.contracts
  end

  def show
  end

  def new
    @contract = current_user.contracts.new
  end

  def create
    @contract = current_user.contracts.new(contract_params)
    if @contract.save
      redirect_to contracts_path, notice: "Contract was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @contract.update(contract_params)
      redirect_to contracts_path, notice: "Contract was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @contract.destroy
    redirect_to contracts_path, notice: "Contract was successfully deleted."
  end

  private

  def set_contract
    @contract = current_user.contracts.find(params[:id])
  end

  def contract_params
    params.require(:contract).permit(:title, :description, :amount, :start_date, :end_date)
  end
end
