Maeku::Types::EntryType = GraphQL::ObjectType.define do

  name 'Entry'

  field :id, !types.ID
  field :type, types.String

end
