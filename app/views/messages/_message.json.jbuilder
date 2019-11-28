json.extract! message, :id, :conversation, :read, :to_user_id, :from_user_id, :created_at, :updated_at
json.listing message.listing, partial: 'listings/listing', as: :listing