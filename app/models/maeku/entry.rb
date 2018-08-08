module Maeku
  class Entry < ApplicationRecord
    belongs_to :author, class_name: Maeku.author_class.to_s
    validates :entry, presence: true
    validates :author_id, presence: true
  end
end
