class AddMoneyController < ApplicationController

  layout 'user'

  before_action :find_user

  def index
    @envelopes = @user.envelopes
  end
end
