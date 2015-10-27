class PaymentsController < ApplicationController
  before_action :def_payment, only:[:show, :edit, :destroy, :update]
  
  def index
    @payments = Payment.all
  end

  def new
    @payment = Payment.new
  end

  def edit
  end

  def create
    #binding.pry
    @payment = Payment.new(payment_params)
    if @payment.save
      redirect_to payments_path
    else 
      flash[:alert] = @payment.errors.full_messages
      render :new
    end
  end

  def update
    @payment.update(payment_params)
    redirect_to @payment
  end

  def show
    
  end

  def destroy
    @payment.destroy
    redirect_to payments_path
  end

  private
  def payment_params
    params.require(:payment).permit(:title, :app, :url)
  end

  def def_payment
    @payment ||= Payment.find(params[:id])
  end
end
