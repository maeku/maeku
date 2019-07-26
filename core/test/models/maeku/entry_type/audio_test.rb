require 'test_helper'

module Maeku
  class EntryType::AudioTest < ActiveSupport::TestCase

    setup do
      author_id = 1
      entry_content = "She spilled some pizza onto the ice."
      @entry = EntryType::Audio.new(author_id: author_id)
      @entry.assign_attributes(entry_content_attributes: { content: entry_content })
      @attachment = {
        io: File.open(Rails.root.join('public', 'credits-music.mp3')),
        filename: "credits-music.mp3",
        content_type: "audio/mpeg"
      }
    end

    test "should reject an entry without an audio file attachment" do
      assert_not @entry.audio_files.attached?
    end

    test "should accept an entry with an audio file attachment" do
      @entry.audio_files.attach(@attachment)
      assert @entry.audio_files.attached?
    end

    test "should reject an entry with a video file attachment" do
      @entry.audio_files.attach(
        io: File.open(Rails.root.join('public', 'dramatic-exit.mp4')),
        filename: 'dramatic-exit.mp4',
        content_type: 'video/mp4'
      )
      assert_not @entry.save
    end

    test "when an audio file is attached, entry type should be Maeku::EntryType::Audio" do
      @entry.audio_files.attach(@attachment)
      assert @entry.type == "Maeku::EntryType::Audio"
    end

  end
end
