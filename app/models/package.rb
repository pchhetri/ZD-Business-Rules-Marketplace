class Package < ActiveRecord::Base

	has_many :triggers
	has_many :macros
	has_many :automations
end
