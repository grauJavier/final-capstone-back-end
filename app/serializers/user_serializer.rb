class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :username
end
