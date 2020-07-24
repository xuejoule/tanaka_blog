# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  # activate :minify_css
  # activate :minify_javascript
  activate :asset_hash
  activate :asset_host, :host => 'https://xuejoule.github.io/tanaka_blog'
end

activate :blog do |blog|
#  blog.prefix = "blog"
# blog.permalink = "blog/{year}/{title}.html"
# blog.permalink = "blog/{category}/{title}.html"
  blog.sources = "{year}-{month}-{day}-{title}.html"
  blog.permalink = "{year}/{month}/{day}/{title}.html"
  blog.default_extension = ".md"
end

helpers do
  def host_url(link)
    'https://xuejoule.github.io/tanaka_blog' + link
#   'http://localhost:4567' + link
  end
end

## GitHub Flavored Markdown
set :markdown, :tables => true, :autolink => true, :gh_blockcode => true, :fenced_code_blocks => true
set :markdown_engine, :redcarpet

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.deploy_method = :git
  deploy.branch = 'gh-pages'
end

