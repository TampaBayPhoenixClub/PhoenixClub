QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema"
  field :member do
    type MemberType
    argument :status, !types.String
    resolve -> (obj, args, ctx) {
      Member.all.where(status: args[:status])
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
