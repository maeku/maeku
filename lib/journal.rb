require "journal/engine"

module Journal
  mattr_accessor :author_class

  def self.author_class
    if @@author_class.is_a?(Class)
      raise "Journal.author_class must be a String or Symbol object, not a "/
        "Class object."
    elsif @@author_class.is_a?(String) || @@author_class.is_a?(Symbol)
      @@author_class.to_s.constantize
    end
  end
end
