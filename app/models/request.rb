class Request < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  #added
  belongs_to :message, dependent: :destroy
end
