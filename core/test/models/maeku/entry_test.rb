require 'test_helper'

module Maeku
  class EntryTest < ActiveSupport::TestCase

    setup do
      author_id = 1
      entry_content = "I saw spoiled fruit on the lawn."
      @entry = Entry.new(author_id: author_id)
      @entry.assign_attributes(entry_content_attributes: { content: entry_content })
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
      audio = File.open("#{public_dir}/credits-music.mp3")
      image = File.open("#{public_dir}/grandparents.jpeg")
      video = File.open("#{public_dir}/dramatic-exit.mp4")

      @entry.audio_files.attach(io: audio, filename: 'credits-music.mp3', content_type: 'audio/mpeg')
      @entry.image_files.attach(io: image, filename: 'grandparents.jpeg', content_type: 'image/jpeg')
      @entry.video_files.attach(io: video, filename: 'dramatic-exit.mp4', content_type: 'video/mp4')
      assert @entry.save!
    end

  end
end
