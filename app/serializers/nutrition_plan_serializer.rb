class NutritionPlanSerializer
  include JSONAPI::Serializer
  attributes :id, :protein, :carbs, :fats, :restrictions, :dislikes

  belongs_to :user

  def self.serialize(resource)
    if resource.is_a?(ActiveRecord::Relation) || resource.is_a?(Array)
      resource.to_a.map { |nutrition_plan| new(nutrition_plan).serializable_hash[:data][:attributes] }
    else
      new(resource).serializable_hash[:data][:attributes]
    end
  end
end
