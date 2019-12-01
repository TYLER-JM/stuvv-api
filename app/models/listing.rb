class Listing < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :messages, through: :requests
  #added
  # has_many :messages

end

