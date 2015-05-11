require 'zendesk_api'

class Trigger < ActiveRecord::Base

validates :name, presence: true

def sync
	client.tickets.first	
end


end
