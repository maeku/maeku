require "maeku/engine"

module Maeku
  mattr_accessor :author_class
  mattr_accessor :current_author

  def self.author_class
    @@author_class.to_s.constantize
  end

  def self.current_author
    @@current_author.to_s.constantize
  end
end
