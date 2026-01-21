# frozen_string_literal: true

require 'html-proofer'
require 'rspec/core/rake_task'

# Default task
task default: :test

# RSpec task
RSpec::Core::RakeTask.new(:spec)

# Jekyll build task
desc 'Build the Jekyll site'
task :build do
  puts 'Building Jekyll site...'
  sh 'bundle exec jekyll build'
  puts 'Build complete!'
end

# HTML Proofer task
desc 'Validate HTML and check for broken links'
task :html_proofer do
  puts 'Running HTML Proofer...'
  options = {
    assume_extension: true,
    check_html: true,
    check_img_http: true,
    enforce_https: false,
    swap_urls: { '^/assets/' => './_site/assets/' },
    ignore_urls: [],
    ignore_files: [],
    allow_missing_href: true,
    ignore_status_codes: [0, 500, 999]
  }
  HTMLProofer.check_directory('./_site', options).run
  puts 'HTML validation complete!'
end

# Combined test task
desc 'Run all tests (build, specs, and HTML validation)'
task test: [:build, :spec, :html_proofer] do
  puts "\n✓ All tests passed!"
end

# Clean task
desc 'Clean built files'
task :clean do
  sh 'rm -rf _site .jekyll-cache .jekyll-metadata'
  puts 'Clean complete!'
end
