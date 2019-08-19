require 'test_helper'

module Maeku
  module Editor
  class EntryPresenterTest < ActiveSupport::TestCase

    setup do
      @entry_with_title = maeku_entries(:four)
      @entry_without_title = maeku_entries(:five)
    end
    
    test "should return entry's title" do
      presenter_title = EntryPresenter.new(@entry_with_title).title
      entry_title = @entry_with_title.entry_content.title
      assert presenter_title, entry_title
    end
    
    test "should return truncated content if entry has no title" do
      presenter_title = EntryPresenter.new(@entry_without_title).title
      generated_title = "A train whistling in the distance..."
      assert presenter_title, generated_title
    end
    
    test "should return entry content" do
      presenter_content = EntryPresenter.new(@entry_with_title).content
      entry_content = @entry_with_title.entry_content.content
      assert presenter_content, entry_content
    end
  end
  end
end
