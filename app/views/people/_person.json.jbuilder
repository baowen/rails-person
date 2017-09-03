json.extract! person, :id, :firstName, :lastName, :email, :created_at, :updated_at
json.url person_url(person, format: :json)
