json.extract! @listing, :id, :title, :user_id, :price_per_day, :availability, :created_at, :updated_at, :description
json.image_urls @listing.images do |image|
   json.url image.url
end
json.url listing_url(@listing, format: :json)