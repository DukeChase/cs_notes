# frozen_string_literal: true

# Obsidian Wiki-Link Converter
# Converts [[filename]] and [[filename|display text]] to standard Markdown links

Jekyll::Hooks.register :documents, :pre_render do |document|
  if document.extname == '.md'
    document.content = convert_obsidian_links(document.content, document)
  end
end

Jekyll::Hooks.register :pages, :pre_render do |document|
  if document.extname == '.md'
    document.content = convert_obsidian_links(document.content, document)
  end
end

def convert_obsidian_links(content, document)
  baseurl = document.site.config['baseurl'] || ''

  # Convert [[filename|display text]] format
  content = content.gsub(/\[\[([^\|\]]+)\|([^\]]+)\]\]/) do |match|
    filename = $1.strip
    display_text = $2.strip
    url = find_file_url(filename, document.site, baseurl)
    "[#{display_text}](#{url})"
  end

  # Convert [[filename]] format
  content = content.gsub(/\[\[([^\]]+)\]\]/) do |match|
    filename = $1.strip
    url = find_file_url(filename, document.site, baseurl)
    "[#{filename}](#{url})"
  end

  content
end

def find_file_url(filename, site, baseurl)
  # Search for the file in the site's pages and documents
  target_file = nil

  # Try exact match first
  site.pages.each do |page|
    if page.path&.end_with?("#{filename}.md") || page.path&.end_with?("#{filename}")
      target_file = page
      break
    end
  end

  # Try to find by filename in path
  if target_file.nil?
    site.pages.each do |page|
      path = page.path || ''
      basename = File.basename(path, '.md')
      if basename == filename || basename.include?(filename)
        target_file = page
        break
      end
    end
  end

  if target_file
    "#{baseurl}#{target_file.url}"
  else
    # Fallback: construct URL from filename
    "#{baseurl}/#{filename}.html"
  end
end

# Handle front matter generation for navigation
Jekyll::Hooks.register :documents, :post_init do |document|
  add_navigation_front_matter(document)
end

Jekyll::Hooks.register :pages, :post_init do |document|
  add_navigation_front_matter(document)
end

def add_navigation_front_matter(document)
  return unless document.extname == '.md'
  return if document.path&.include?('_plugins')
  return if document.path&.include?('_data')

  path = document.relative_path.to_s

  # Skip special files
  return if path.start_with?('_')
  return if path == 'index.md'
  return if path == 'README.md'

  # Extract title from filename
  filename = File.basename(path, '.md')

  # Generate nav_order and parent based on directory structure
  parts = path.split('/')

  # Get the top-level directory for parent
  if parts.length > 1
    parent_dir = parts.first
    parent_name = parent_dir.gsub(/^\d+-/, '')  # Remove numeric prefix

    # Set default values if not already set
    document.data['title'] ||= filename
    document.data['parent'] ||= parent_name
    document.data['layout'] ||= 'default'
  else
    document.data['title'] ||= filename
    document.data['layout'] ||= 'default'
  end
end