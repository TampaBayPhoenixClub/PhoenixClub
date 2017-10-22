ShowType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema"
  field :member do
    type MemberType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      Member.find(id: args[:id])
    }
  end

  field :visit do
    type VisitType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      Visit.find(args[:id])
    }
  end

  end
