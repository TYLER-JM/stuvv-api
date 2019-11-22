class Listing < ApplicationRecord
  belongs_to :user
  # has_many :images
  has_many_attached :pics
  has_many :requests

  include Rails.application.routes.url_helpers

  def pics_urls
    pics.collect {|pic| rails_blob_path(pic, only_path: true)}
  end

end
