VisitType = GraphQL::ObjectType.define do
 name "Visit"
  description "A Visit"
  field :id, types.ID
  field :code, types.String
  field :create_at, types.DateTime

  field :sponsor do
    type types[MemberType]
    resolve -> (visit, args, ctx) {
      visit.sponsor
    }
  end
end
