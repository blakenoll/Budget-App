class TransactionsController < ApplicationController

  layout 'user'

  before_action :set_transaction, only: [:edit, :update, :destroy]
  before_action :find_user

  def index
    @transactions = @user.transactions.newest_first
  end

  def new
    @transaction = Transaction.new
    @envelopes = @user.envelopes
    @transaction.envelope_id = params[:envelope_id]
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user = @user
    @envelope = Envelope.find(transaction_params[:envelope_id])
    @transaction.envelope_name = @envelope.name
    @envelope.total -= @transaction.amount

    if @transaction.save && @envelope.save
      redirect_to envelope_path(@envelope)
      flash[:notice] = 'Transaction succesfully added'
    else
      render :new
    end
  end

  def edit
    @envelopes = @user.envelopes
  end

  def update
    @envelope = @transaction.envelope
    print(@envelope.id)
    if @envelope.id != transaction_params[:envelope_id].to_f
      @envelope.total = (@envelope.total + @transaction.amount)
      @new_envelope = Envelope.find(transaction_params[:envelope_id])
      @new_envelope.total -= transaction_params[:amount].to_f
      @transaction.envelope_name = @new_envelope.name
      @new_envelope.save
    else
    @envelope.total = ((@envelope.total + @transaction.amount) - transaction_params[:amount].to_f)
    end
    if @transaction.update(transaction_params) && @envelope.save
      redirect_to envelopes_path
      flash[:notice] = 'Envelope updated succesfully'
    else
      render :edit
    end
  end

  def destroy
    @envelope = @transaction.envelope
    @envelope.total += @transaction.amount
    if @envelope.save && @transaction.destroy
      flash[:notice] = "Transaction succesfully deleted"
      redirect_to(transactions_path)
    end
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:envelope_id, :name, :amount, :date)
  end


end
