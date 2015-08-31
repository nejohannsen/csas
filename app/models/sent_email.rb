class SentEmail < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_and_belongs_to_many :campaigns
  has_and_belongs_to_many :events

end
