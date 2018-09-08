module Maeku
  class Entry < ApplicationRecord
    belongs_to :author, class_name: Maeku.author_class.to_s
    has_one :entry_content

    accepts_nested_attributes_for :entry_content, update_only: true

    validates :author_id, presence: true
    validates :entry_content, presence: true
  end
end
