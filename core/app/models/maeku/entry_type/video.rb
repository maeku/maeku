module Maeku
  class EntryType::Video < Entry
    validates :video_files, attached: true, content_type: ['video/mp4', 'video/webm']
  end
end
