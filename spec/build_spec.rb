# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Jekyll Build' do
  before(:all) do
    @site_dir = File.expand_path('../_site', __dir__)
  end

  describe 'Site Generation' do
    it 'generates the _site directory' do
      expect(Dir.exist?(@site_dir)).to be true
    end

    it 'generates index.html' do
      expect(File.exist?(File.join(@site_dir, 'index.html'))).to be true
    end

    it 'generates about page' do
      expect(File.exist?(File.join(@site_dir, 'about', 'index.html'))).to be true
    end

    it 'generates 404 page' do
      expect(File.exist?(File.join(@site_dir, '404.html'))).to be true
    end

    it 'generates feed.xml from jekyll-feed plugin' do
      expect(File.exist?(File.join(@site_dir, 'feed.xml'))).to be true
    end
  end

  describe 'HTML Structure' do
    let(:index_html) { File.read(File.join(@site_dir, 'index.html'), encoding: 'UTF-8') }

    it 'homepage contains valid HTML with DOCTYPE' do
      expect(index_html).to match(/<!DOCTYPE html>/i)
    end

    it 'homepage contains opening and closing html tags' do
      expect(index_html).to match(/<html.*>.*<\/html>/m)
    end

    it 'homepage contains head section' do
      expect(index_html).to match(/<head>.*<\/head>/m)
    end

    it 'homepage contains body section' do
      expect(index_html).to match(/<body.*>.*<\/body>/m)
    end

    it 'homepage contains title tag' do
      expect(index_html).to match(/<title>.*<\/title>/)
    end
  end

  describe 'Asset Generation' do
    it 'generates CSS files' do
      css_files = Dir.glob(File.join(@site_dir, 'assets', '**', '*.css'))
      expect(css_files).not_to be_empty
    end
  end
end
