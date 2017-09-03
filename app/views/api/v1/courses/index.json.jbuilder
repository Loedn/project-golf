json.array! @courses do |course|
  json.extract! course, :name, :id
end
