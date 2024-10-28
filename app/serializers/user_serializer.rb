class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :first_name, :last_name

  def self.serialize(resource)
    if resource.is_a?(ActiveRecord::Relation) || resource.is_a?(Array)
      resource.to_a.map { |user| new(user).serializable_hash[:data][:attributes] }
    else
      new(resource).serializable_hash[:data][:attributes]
    end
  end
end
