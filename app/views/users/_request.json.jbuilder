# json.extract! request, :id, :title, :user, :price_per_day, :availability, :created_at, :updated_at, :description

json.extract! request, :id, :listing, :user, :start_date, :end_date, :approved, :message_id

# json.listing_images request.listing, partial: 'listings/listing', as: :listing

# json.image_urls request.images do |image|
#    json.url image.url
# end
json.listing_urls request.listing.images do |image|
   json.url image.url
end

json.listing_owner request.listing.user


# json.url requests_url(request, format: :json)