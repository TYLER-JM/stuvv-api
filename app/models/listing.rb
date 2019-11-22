class Listing < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :requests

end
