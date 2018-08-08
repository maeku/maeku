module Maeku
  module AuthorMethods

    extend ActiveSupport::Concern

    included do
      has_many :entries, foreign_key: "author_id", class_name: "Maeku::Entry", dependent: :destroy
    end

  end
end
