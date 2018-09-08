module Maeku
  class EntryContent < ApplicationRecord
    validates :content, presence: true
    belongs_to :entry, dependent: :delete
  end
end
