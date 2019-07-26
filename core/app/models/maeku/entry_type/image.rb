module Maeku
  class EntryType::Image < Entry
    has_many_attached :image_files

    image_types = %w[ image/gif image/jpeg image/jpg image/png ]

    validates :image_files, attached: true, content_type: image_types
  end
end
