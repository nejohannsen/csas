class Campaign < ActiveRecord::Base
  has_paper_trail
  has_many :attachments, as: :attachable
  has_many :resources, through: :attachments
  belongs_to :user

  has_many :campaign_characters
  has_many :characters, through: :campaign_characters


  belongs_to :game

  belongs_to :image, class_name: "Resource"
end
