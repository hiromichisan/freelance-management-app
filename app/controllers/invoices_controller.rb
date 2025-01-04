class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invoice, only: %i[show edit update destroy]

  def index
    @invoices = current_user.invoices
  end

  def show
  end

  def new
    @invoice = current_user.invoices.new
  end

  def create
    @invoice = current_user.invoices.new(invoice_params)
    if @invoice.save
      redirect_to invoices_path, notice: "Invoice was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @invoice.update(invoice_params)
      redirect_to invoices_path, notice: "Invoice was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @invoice.destroy
    redirect_to invoices_path, notice: "Invoice was successfully deleted."
  end

  private

  def set_invoice
    @invoice = current_user.invoices.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:description, :amount, :due_date)
  end
end
