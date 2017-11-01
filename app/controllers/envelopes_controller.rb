class EnvelopesController < ApplicationController

  layout 'user'

  before_action :find_user
  before_action :set_envelope, only: [:show, :edit, :update, :destroy]

  def index
    @envelopes = @user.envelopes
    @total = @envelopes.sum(:total)
  end

  def show
    @envelope = Envelope.find(params[:id])
    @transactions = @envelope.transactions
    # @envelope.total = @envelope.total - @transactions.sum(:amount)
  end

  def new
    @envelope = Envelope.new
  end

  def edit
    @envelope = Envelope.find(params[:id])
  end

  def edit_multiple
    @envelopes = @user.envelopes
  end

  def create
    @envelope = Envelope.new(envelope_params)
    @envelope.user = @user
    @envelope.total = 0
    if @envelope.save
      redirect_to envelopes_path
      flash[:notice] = 'Envelope succesfully added'
    else
      render :new
    end
  end

  def update
    if @envelope.update(envelope_params)
      redirect_to envelopes_path
      flash[:notice] = 'Envelope updated succesfully'
    else
      render :edit
    end
  end

  def update_multiple
    params[:envelopes].each_pair do |k, v|
      envelope = Envelope.find(k)
      envelope.total += v['total'].to_i
      envelope.save
    end
    redirect_to envelopes_path
  end

  def destroy
    @envelope.transactions.destroy_all
    @envelope.destroy
    flash[:notice] = 'Envelope succesfully deleted'
    redirect_to envelopes_path
  end

  private

  def set_envelope
      @envelope = Envelope.find(params[:id])
      if @envelope.user_id != session[:user_id]
        redirect_to login_path
        flash[:notice] = "Permission Denied. Enevelope does not belong ot you"
      end
  end

  def envelope_params
    params.require(:envelope).permit(:name, :initialTotal, :total)
  end

end
