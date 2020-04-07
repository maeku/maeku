require 'test_helper'

module Maeku
  class EntryTest < ActiveSupport::TestCase

    setup do
      @entry = maeku_entries(:simple)
      @content = @entry.entry_content.content
    end

    test "should create new entry if entry and author are set" do
      assert Entry.create!(
        author: authors(:bashō),
        entry_content_attributes: { content: @content }
      )
    end

    test "should not create new entry if entry has no content" do
      assert_raises(ActiveRecord::RecordInvalid, "Entry content can't be blank") do
        Entry.create!(author: authors(:bashō))
      end
    end

    test "should not create new entry if author_id is nil" do
      assert_raises(ActiveRecord::RecordInvalid, "Author can't be blank") do
        Entry.create!(
          author: nil,
          entry_content_attributes: { content: @content }
        )
      end
    end

    test "entry without type is assigned the 'EntryType::Simple' type" do
      entry = Entry.new(
        author: authors(:bashō),
        type: nil,
        entry_content_attributes: { content: @content }
      )

      entry.save!

      assert entry.type, Maeku::EntryType::Simple.name

      entry.update(type: nil)

      assert entry.type, Maeku::EntryType::Simple.name
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
      author = @entry.author
      entries = Entry.entries_for ::Maeku.author_class.find(author.id)

      assert entries.all? { |entry| entry.author_id == entry.author.id }
    end
  end
end
