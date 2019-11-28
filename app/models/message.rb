class Message < ApplicationRecord
  belongs_to :to_user, :class_name => 'User'
  belongs_to :from_user, :class_name => 'User'

  #added
  # belongs_to :listing
  has_one :request
end
