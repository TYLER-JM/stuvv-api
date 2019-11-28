class Listing < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :requests

  #added
  # has_many :messages

end
