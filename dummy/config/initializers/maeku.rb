Maeku.author_class = "User"

if Rails.env.development?
  Rails.application.config.assets.precompile += %w[
    maeku/editor/editor.dev.css
    maeku/editor/editor.dev.js
  ]
else
  Rails.application.config.assets.precompile += %w[
    maeku/editor/editor.css
    maeku/editor/editor.js
  ]
end

