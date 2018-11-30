require 'test_helper'

module Maeku
  class EntryType::AudioTest < ActiveSupport::TestCase

    setup do
      author_id = 1
      entry_content = "She spilled some pizza onto the ice."
      @entry = Entry.new(author_id: author_id)
      @entry.assign_attributes(entry_content_attributes: { content: entry_content })
      @attachment = File.open(Rails.root.join('public', 'credits-music.mp3'))
    end

    test "should reject an entry without an audio file attachment" do
      assert_not @entry.audio_files.attached?
    end

    test "should accept an entry with an audio file attachment" do
      @entry.audio_files.attach(io: @attachment, filename: 'credits-music.mp3', content_type: 'audio/mpeg')
      assert @entry.audio_files.attached?
    end

  end
end
