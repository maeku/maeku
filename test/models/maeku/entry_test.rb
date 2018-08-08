require 'test_helper'

module Maeku
  class EntryTest < ActiveSupport::TestCase
    
    setup do
      entry = "I saw spoiled fruit on the lawn."
      author_id = 1
      @entry = Entry.new(entry: entry, author_id: author_id) 
    end
    
    test "should create new entry if entry and author_id exist" do
      assert @entry.save
    end
    
    test "should not create new entry if entry is nil" do
      @entry.entry = nil
      assert_not @entry.save
    end
    
    test "should not create new entry if author_id is nil" do
      @entry.author_id = nil
      assert_not @entry.save
    end
    
  end
end
