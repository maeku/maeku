module Maeku
  class EntryType::Audio < Entry
    validates :audio_files, attached: true,  content_type: ['audio/aac', 'audio/midi', 'audio/mpeg', 'audio/webm', 'audio/x-wav']
  end
end
