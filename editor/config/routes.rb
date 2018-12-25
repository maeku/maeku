Maeku::Engine.routes.draw do
  mount ::Maeku::Editor::Engine, at: '/editor'
end

Maeku::Editor::Engine.routes.draw do
  root to: 'home#index'
end
