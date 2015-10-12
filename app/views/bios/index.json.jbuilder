json.array!(@bios) do |bio|
  json.extract! bio, :id, :birthday, :city, :age, :user
  json.url bio_url(bio, format: :json)
end
