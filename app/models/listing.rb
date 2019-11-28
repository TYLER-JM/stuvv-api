class Listing < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :requests
  has_many :messages, through: :requests
  #added
  # has_many :messages

end
