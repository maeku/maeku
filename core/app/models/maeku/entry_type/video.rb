module Maeku
  class EntryType::Video < Entry
    has_many_attached :video_files

    video_types = %w[ video/mp4 video/webm ]

    validates :video_files, attached: true, content_type: video_types
  end
end
