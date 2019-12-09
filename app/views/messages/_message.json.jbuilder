json.extract! message, :id, :sender, :receiver, :contents, :sent_at, :seen, :created_at, :updated_at
json.url message_url(message, format: :json)
