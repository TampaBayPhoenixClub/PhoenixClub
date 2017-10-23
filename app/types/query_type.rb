QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema"
  field :members do
    type types[MemberType]
    argument :status, !types.String
    resolve -> (obj, args, ctx) {
      if args[:status].present?
      Member.all.where(status: args[:status])
    else
      Member.all
    end
    }
  end

  field :member_search do
    type types[MemberType]
    argument :query, !types.String
    resolve -> (obj, args, ctx) {
      Member.search(args[:query])
    }
  end

  field :member do
    type MemberType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      Member.find(args[:id])
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
