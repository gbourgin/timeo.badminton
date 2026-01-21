# frozen_string_literal: true

require 'spec_helper'
require 'yaml'

RSpec.describe 'Content Validation' do
  describe 'Site Configuration' do
    let(:config) { YAML.load_file('_config.yml') }

    it 'has a title' do
      expect(config['title']).not_to be_nil
      expect(config['title']).not_to be_empty
    end

    it 'has a description' do
      expect(config['description']).not_to be_nil
      expect(config['description']).not_to be_empty
    end

    it 'has a valid email address' do
      expect(config['email']).not_to be_nil
      expect(config['email']).to match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
    end

    it 'has a valid URL' do
      expect(config['url']).not_to be_nil
      expect(config['url']).to match(/\Ahttps?:\/\//)
    end

    it 'has a baseurl defined' do
      expect(config).to have_key('baseurl')
    end

    it 'specifies the Minima theme' do
      expect(config['theme']).to eq('minima')
    end

    it 'has jekyll-feed plugin configured' do
      expect(config['plugins']).to include('jekyll-feed')
    end
  end

  describe 'Page Front Matter' do
    Dir.glob('*.markdown').each do |file|
      context "#{file}" do
        let(:content) { File.read(file, encoding: 'UTF-8') }
        let(:front_matter) do
          match = content.match(/\A---\n(.*?)---\n/m)
          match ? YAML.safe_load(match[1]) : {}
        end

        it 'has valid YAML front matter' do
          expect(content).to match(/\A---\n.*?---\n/m)
        end

        it 'has a layout defined' do
          expect(front_matter['layout']).not_to be_nil
        end
      end
    end
  end

  describe 'Content Quality' do
    let(:index_content) { File.read('index.markdown', encoding: 'UTF-8') }

    it 'homepage has substantial content' do
      # Remove front matter and check content length
      content_without_front_matter = index_content.gsub(/\A---\n.*?---\n/m, '')
      expect(content_without_front_matter.length).to be > 100
    end

    it 'homepage mentions badminton' do
      expect(index_content.downcase).to include('badminton')
    end
  end

  describe 'Required Files' do
    it 'has a README' do
      expect(File.exist?('README.md')).to be true
    end

    it 'has a LICENSE' do
      expect(File.exist?('LICENSE')).to be true
    end

    it 'has a .gitignore' do
      expect(File.exist?('.gitignore')).to be true
    end

    it 'has a Gemfile' do
      expect(File.exist?('Gemfile')).to be true
    end

    it 'has a custom 404 page' do
      expect(File.exist?('404.html')).to be true
    end
  end
end
