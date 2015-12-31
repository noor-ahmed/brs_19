class RequestsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  def index
    @requests = current_user.requests
  end

  def new
  end

  def create
    @request.user = current_user
    if @request.save
      flash[:success] = t ".success"
      redirect_to requests_path
    else
      render :new
    end
  end

  def destroy
    @request.destroy
    flash[:success] = t ".delete"
    redirect_to requests_path
  end

  private
  def request_params
    params.require(:request).permit :title, :author, :description, :link
  end
end
