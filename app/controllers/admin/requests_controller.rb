class Admin::RequestsController < ApplicationController
  
  def index
    @requests = Request.all
  end

  def update
    if @request.not_approved!
      flash[:success] = t ".not_approve"
      redirect_to admin_requests_path
    else
      redirect_to admin_requests_path
    end
  end
end