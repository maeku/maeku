module Maeku
  class Types::EntryType < Types::BaseType
    field :id, ID, null: false
    field :author, Types::AuthorType, null: false
    field :type, String, null: true
    field :content, String, null: true
    # todo ~ what's the best way to include entry attachments in api queries?
    # todo ~ i think the answer is urls.
    # field :attachments, [String], null: true
    def id
      object.id
    end

    def content
      Entry.find(id).entry_content.content
    end

    def type
      object.type
    end
  end
end
