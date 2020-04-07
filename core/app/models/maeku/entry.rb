require 'active_storage_validations'

module Maeku
  class Entry < ApplicationRecord
    belongs_to :author, class_name: Maeku.author_class.to_s

    has_one :entry_content
    has_many_attached :audio_files
    has_many_attached :image_files
    has_many_attached :video_files

    accepts_nested_attributes_for :entry_content, update_only: true

    validates :author_id, presence: true
    validates :entry_content, presence: true
    validates :audio_files, content_type: ['audio/aac', 'audio/midi', 'audio/mpeg', 'audio/webm', 'audio/x-wav']
    validates :image_files, content_type: ['image/gif', 'image/jpeg', 'image/jpg', 'image/png']
    validates :video_files, content_type: ['video/mp4', 'video/webm']

    validates_presence_of :audio_files, if: Proc.new { |entry| entry.type == 'Maeku::EntryType::Audio' }
    validates_presence_of :image_files, if: Proc.new { |entry| entry.type == 'Maeku::EntryType::Image' }
    validates_presence_of :video_files, if: Proc.new { |entry| entry.type == 'Maeku::EntryType::Video' }

    before_save :set_entry_type

    def set_entry_type
      self.type = EntryType::Simple unless self.type
    end

    class << self
      def entries_for(author)
        self.all.where(author_id: author.id)
      end
    end
  end
end
