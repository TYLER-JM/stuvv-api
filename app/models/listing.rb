class Listing < ApplicationRecord
  belongs_to :user
  has_meny :images
end
