
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w(manifest.js manifest.css rademade_admin.css rademade_admin.js)
Rails.application.config.assets.initialize_on_precompile = true

