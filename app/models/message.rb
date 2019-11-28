class Message < ApplicationRecord
  belongs_to :to_user, :class_name => 'User'
  belongs_to :from_user, :class_name => 'User'

  def name
    "Mikias"
  end
  
  has_one :request
  has_one :listing, through: :request
end
