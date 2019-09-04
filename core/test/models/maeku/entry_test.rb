require 'test_helper'

module Maeku
  class EntryTest < ActiveSupport::TestCase

    setup do
      content = maeku_entry_contents(:one).dup
      @entry = maeku_entries(:one).dup
      @entry.entry_content = content
    end

    test "should create new entry if entry and author_id exist" do
      assert @entry.save
    end

    test "should not create new entry if entry has no content" do
      @entry.entry_content = nil
      assert_not @entry.save
    end

    test "should not create new entry if author_id is nil" do
      @entry.author_id = nil
      assert_not @entry.save
    end

    test "should accept audio, image, and video attachments" do
      public_dir = Rails.root.join('public')
      audio = File.open("#{public_dir}/credits-music.mp3", 'r')
      image = File.open("#{public_dir}/grandparents.jpeg", 'r')
      video = File.open("#{public_dir}/dramatic-exit.mp4", 'r')

      @entry.audio_files.attach(io: audio, filename: 'credits-music.mp3', content_type: 'audio/mpeg')
      assert @entry.save

      @entry.image_files.attach(io: image, filename: 'grandparents.jpeg', content_type: 'image/jpeg')
      assert @entry.save

      @entry.video_files.attach(io: video, filename: 'dramatic-exit.mp4', content_type: 'video/mp4')
      assert @entry.save
    end

    test "should only show entries by single author" do
      entries = Entry.entries_for ::Maeku.author_class.find(1)
      assert entries.all? { |entry| entry.author_id == 1 }
    end
  end
end
