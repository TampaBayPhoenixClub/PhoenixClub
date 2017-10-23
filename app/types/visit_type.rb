VisitType = GraphQL::ObjectType.define do
 name "Visit"
  description "A Visit"
  field :id, types.ID
  field :code, types.String
  field :create_at, types.String

end
