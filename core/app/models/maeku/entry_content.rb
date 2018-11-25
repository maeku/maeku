module Maeku
  class EntryContent < ApplicationRecord
    belongs_to :entry, dependent: :delete
  end
end
