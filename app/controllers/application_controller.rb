class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  # force signout to prevent cross-site req forgery 
  def handle_unverified_request
  	signout
  	super
  end
 	
end
