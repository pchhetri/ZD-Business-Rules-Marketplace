class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  helper:all

  protect_from_forgery with: :exception

  private

  def confirm_logged_in
    unless session[:username]
      flash[:notice] = "Please enter your credentials and retry!"
      redirect_to(:back)
      return false # halts the before_action
    else
      return true
    end
  end

  def client
    FooClient.instance(session[:subdomain], session[:username], session[:token])
  end

  class FooClient < ZendeskAPI::Client
    def self.instance(subdomain=nil, username=nil, token=nil)
      @instance ||= new do |config|

        config.url = "https://#{subdomain}.zendesk.com/api/v2"
        config.username = username
        config.token = token

        config.retry = true

        config.logger = Rails.logger
      end
    end
  end


end
