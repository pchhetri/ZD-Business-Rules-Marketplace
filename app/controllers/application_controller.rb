class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  helper:all

  protect_from_forgery with: :exception

  private

  def client
  end

  class FooClient < ZendeskAPI::Client
      @instance ||= new do |config|


        config.retry = true

        config.logger = Rails.logger
      end
    end

  end


end
