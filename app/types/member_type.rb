MemberType = GraphQL::ObjectType.define do
 name "Member"
  description "A Member"
  field :id, types.ID
  field :first_name, types.String
  field :last_name, types.String
  field :scene_name, types.String
  field :status, types.String
  field :join_date, types.DateTime
  field :renewal_date, types.DateTime
  field :birthday, type.DateTime

  field :visit do
    type types[VisitType]
    argument :size, types.Int, default_value: 10
    resolve -> (member, args, ctx) {
      member.visits.limit(args[:size])
    }
  end
end
