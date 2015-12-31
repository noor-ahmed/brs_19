class RequestsController < ApplicationController
  before_action :authenticate_user!
  def index
    @requests = current_user.requests
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new request_params
    if @request.save
      flash[:success] = t ".success"
      redirect_to requests_path
    else
      flash[:alert] = t ".alert"
      render :new
    end
  end

  private
  def request_params
    params.require(:request).permit :title, :author, :description, :link
  end
end
