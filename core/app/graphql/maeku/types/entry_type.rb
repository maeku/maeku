module Maeku
  class Types::EntryType < Types::BaseType
    field :id, ID, null: false
    field :type, String, null: true
    field :entry_content, Types::EntryContentType, null: true
    # todo ~ what's the best way to include entry attachments in api queries?
    # todo ~ i think the answer is urls.
    # field :attachments, [String], null: true
  end
end
