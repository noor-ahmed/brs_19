class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :load_and_authorize_resource
  
  def home
  end

  def about
  end

  def contact
  end
end
