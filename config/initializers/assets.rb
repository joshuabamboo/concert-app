# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "flaticon")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "mfp", 'css')
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "offcanvas-menu", 'css')
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "progresstracker", 'css')
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "rs-plugin", 'assets')
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "rs-plugin", 'css')
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "rs-plugin", 'css', 'navigation-skins')
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "styleselector")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "superfish", "css")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "wow")

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( *.png *.jpg *.jpeg *.gif *.mp4 )
