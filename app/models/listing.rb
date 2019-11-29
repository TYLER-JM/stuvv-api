class Listing < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :delete_all
  has_many :requests, dependent: :delete_all
  has_many :messages, through: :requests
  #added
  # has_many :messages

end
