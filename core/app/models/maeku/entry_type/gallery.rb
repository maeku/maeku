module Maeku
  class EntryType::Gallery < Entry
    validates :image_files, attached: true, content_type: ['image/gif', 'image/jpeg', 'image/jpg', 'image/png']
  end
end
