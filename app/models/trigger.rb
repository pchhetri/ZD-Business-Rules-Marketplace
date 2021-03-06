class Trigger < ActiveRecord::Base

  validates :name, presence: true
  validates :tags, presence: true
  validates :json, presence: true

  belongs_to :package
end
