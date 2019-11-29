json.extract! message, :id, :conversation, :read, :to_user_id, :from_user, :created_at, :updated_at, :name

json.listing message.listing, partial: 'listings/listing', as: :listing
