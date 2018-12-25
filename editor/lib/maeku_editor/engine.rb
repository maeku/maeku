module Maeku
  module Editor
    class Engine < ::Rails::Engine
      isolate_namespace ::Maeku::Editor
    end
  end
end
