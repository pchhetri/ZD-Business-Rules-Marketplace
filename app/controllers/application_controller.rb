class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  helper:all

  protect_from_forgery with: :exception

  private

  def client
    FooClient.instance
  end

  class FooClient < ZendeskAPI::Client
    def self.instance
      @instance ||= new do |config|

        config.url = "https://pchhetri.zendesk.com/api/v2"
        config.username = "pchhetri@zendesk.com/token"
        config.password = "VucMYuFAJJ1lFRkTguArXF4IELUKRslIiYHPdf51"

        config.retry = true

        config.logger = Rails.logger
      end
    end

    # def tickets(email)
    #   search(:query => "requester:#{email}")
    # end
  end


end
