#Markdown
activate :syntax
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, :smartypants => true
#Livereload
activate :livereload

# Asset Settings
set :css_dir, 'assets/css'
set :js_dir, 'assets/js'
set :images_dir, 'assets/img'

# Add bower's directory to sprockets asset path
after_configuration do
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  sprockets.append_path File.join "#{root}", @bower_config["directory"]
end

activate :directory_indexes
# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

# Deploy
activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = true # default: false
  deploy.branch = "gh-pages"
end

