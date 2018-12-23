require 'test_helper'

module Maeku
  class EntryType::ImageTest < ActiveSupport::TestCase

    setup do
      author_id = 1
      entry_content = "The photograph was difficult to see in this light."
      @entry = Entry.new(author_id: author_id)
      @entry.assign_attributes(entry_content_attributes: { content: entry_content })
      @attachment = File.open(Rails.root.join('public', 'grandparents.jpeg'))
    end

    test "should reject an entry without an image file attachment" do
      assert_not @entry.image_files.attached?
    end

    test "should accept an entry with an image file attachment" do
      @entry.image_files.attach(io: @attachment, filename: 'grandparents.jpeg', content_type: 'image/jpeg')
      assert @entry.image_files.attached?
    end

  end
end
