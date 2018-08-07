class User < ApplicationRecord
  include Journal::AuthorMethods
end
