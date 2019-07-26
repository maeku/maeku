module Maeku
  class EntryType::Audio < Entry
    has_many_attached :audio_files

    audio_types = %w[ audio/aac audio/midi audio/mpeg audio/webm audio/x-wav ]

    validates :audio_files, attached: true, content_type: audio_types
  end
end
