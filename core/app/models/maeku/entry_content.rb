module Maeku
  class EntryContent < ApplicationRecord
    belongs_to :entry, dependent: :delete, touch: true
  end
end
