require 'test_helper'

module Maeku
  class EntryType::VideoTest < ActiveSupport::TestCase

    setup do
      author_id = authors(:bashō).id
      entry_content = "I turned the TV off."
      @entry = EntryType::Video.new(author_id: author_id)
      @entry.assign_attributes(entry_content_attributes: { content: entry_content })
      @attachment = {
        io: File.open(Rails.root.join('public', 'dramatic-exit.mp4')),
        filename: 'dramatic-exit.mp4',
        content_type: 'video/mp4'
      }
    end

    test "should reject an entry without an video file attachment" do
      assert_not @entry.video_files.attached?
    end

    test "should accept an entry with an video file attachment" do
      @entry.video_files.attach(@attachment)
      assert @entry.video_files.attached?
    end

    test "should reject an entry with a non-video file attachment" do
      attachment = {
        io: File.open(Rails.root.join('public', 'credits-music.mp3')),
        filename: "credits-music.mp3",
        content_type: "audio/mpeg"
      }
      @entry.video_files.attach(attachment)
      assert_not @entry.save
    end

    test "when a video file is attached, entry type should be Maeku::EntryType::Video" do
      @entry.video_files.attach(@attachment)
      assert @entry.type == "Maeku::EntryType::Video"
    end
  end
end
