json.extract! user, :id, :first_name, :last_name, :birthday, :address
json.url user_url(user, format: :json)
