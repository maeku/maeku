module Journal
  class Entry < ApplicationRecord
    belongs_to :author, class_name: Journal.author_class.to_s

    before_validation :set_author

    private

    def set_author
      self.author = Journal.author_class.find_or_create_by(id: author_id)
    end
  end
end
