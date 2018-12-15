module Maeku
  class Engine < ::Rails::Engine
    isolate_namespace ::Maeku::Editor
  end
end
