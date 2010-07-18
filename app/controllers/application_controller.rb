# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :getBodyClass

  private
    def getBodyClass
      if (controller_name == 'items' && action_name == 'index') 
        @bodyClass = 'snufflr_home';
      elsif (controller_name == 'items' && action_name == 'show') 
        @bodyClass = 'snufflr_item'; 
      elsif (controller_name == 'users' && action_name == 'show') 
        @bodyClass = 'snufflr_user'; 
      else 
        @bodyClass = ''; 
      end
    end

    def getThumbnailSize
      if params[:size] == 'large'
        @viewSize = 'large'
      else 
        @viewSize = 'small'
      end
      puts "SIZE: #{@viewSize}"
    end
  

unless ActionController::Base.consider_all_requests_local
  rescue_from Exception,                            :with => :render_error
  rescue_from ActiveRecord::RecordNotFound,         :with => :render_not_found
  rescue_from ActionController::RoutingError,       :with => :render_not_found
  rescue_from ActionController::UnknownController,  :with => :render_not_found
  rescue_from ActionController::UnknownAction,      :with => :render_not_found
end

private

def render_not_found(exception)
  log_error(exception)
  render :template => "/error/404.html.erb", :status => 404, :layout => 'error'
end

def render_error(exception)
  log_error(exception)
  render :template => "/error/500.html.erb", :status => 500, :layout => 'error'
end

  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
end
