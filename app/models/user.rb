class User < ApplicationRecord
  has_many :listings
  has_many :requests
  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'from_user_id'
  has_many :received_messages, :class_name => 'Message', :foreign_key => 'to_user_id'

  has_secure_password


end
