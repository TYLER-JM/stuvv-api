json.extract! request, :id, :title, :user_id, :price_per_day, :availability, :created_at, :updated_at, :description
json.image_urls request.images do |image|
   json.url image.url
end
json.url requests_url(request, format: :json)