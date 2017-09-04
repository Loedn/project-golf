json.array! @users do |user|
  json.extract! user, :index, :email
end
