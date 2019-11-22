json.extract! @listing, :id, :title, :user_id, :price_per_day, :availability, :created_at, :updated_at, :pics_urls, :description
json.url listing_url(@listing, format: :json)