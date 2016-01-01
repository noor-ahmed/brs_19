class Admin::RequestsController < ApplicationController
  def index
    @requests = Request.pending
  end

  def update
    if @request.send "#{params[:request][:status]}!"
      flash[:success] = I18n.t ".request_success"
    else
      flash[:alert] = I18n.t ".request_failed"
    end
    redirect_to admin_requests_path
  end
end