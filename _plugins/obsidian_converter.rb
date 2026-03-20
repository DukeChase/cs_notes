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
# This hook runs after all pages are initialized but before rendering
Jekyll::Hooks.register :site, :post_read do |site|
  # Build a map of directory to index page title
  dir_to_title = {}
  
  site.pages.each do |page|
    next unless page.extname == '.md'
    next if page.path&.include?('_plugins')
    next if page.path&.include?('_data')
    
    path = page.relative_path.to_s
    # If this is an index.md file, map its directory to its title
    if File.basename(path) == 'index.md'
      dir = File.dirname(path)
      dir = '' if dir == '.'
      title = page.data['title']
      dir_to_title[dir] = title if title
    end
  end
  
  # Set up navigation hierarchy for non-index pages
  site.pages.each do |page|
    next unless page.extname == '.md'
    next if page.path&.include?('_plugins')
    next if page.path&.include?('_data')
    
    path = page.relative_path.to_s
    
    # Skip special files and index files
    next if path.start_with?('_')
    next if File.basename(path) == 'index.md'
    next if path == 'README.md'
    next if path == 'AGENTS.md'
    next if path == 'QWEN.md'
    next if path == 'todo.md'
    next if path == 'readlist.md'
    
    # Extract title from first h1 heading or filename
    filename = File.basename(path, '.md')
    title = extract_title(page.content) || filename.gsub(/^\d+-/, '')
    
    # Generate nav_order and parent based on directory structure
    parts = path.split('/')
    
    if parts.length > 1
      # Get the immediate parent directory
      parent_dir = parts[0...-1].join('/')
      
      # Look up the parent title from dir_to_title map
      parent_name = dir_to_title[parent_dir]
      
      # If no index.md found, use the directory name
      if parent_name.nil?
        parent_dir_name = parts[-2] if parts.length > 1
        parent_name = parent_dir_name&.gsub(/^\d+-/, '')
      end
      
      # Set default values if not already set
      page.data['title'] ||= title
      page.data['parent'] ||= parent_name if parent_name
      page.data['layout'] ||= 'default'
      
      # Set nav_order based on filename prefix
      if filename =~ /^(\d+)-/
        page.data['nav_order'] ||= $1.to_i
      end
    else
      # Top-level files
      page.data['title'] ||= title
      page.data['layout'] ||= 'default'
      
      if filename =~ /^(\d+)-/
        page.data['nav_order'] ||= $1.to_i
      end
    end
  end
  
  # Mark parent pages with has_children
  site.pages.each do |page|
    next unless page.extname == '.md'
    
    page_title = page.data['title']
    next if page_title.nil? || page_title.empty?
    
    # Check if any page has this page as parent
    has_children = site.pages.any? do |p|
      p.data['parent'] == page_title && p != page
    end
    
    if has_children
      page.data['has_children'] = true
    end
  end
end

def extract_title(content)
  return nil if content.nil?
  
  # Look for the first h1 heading
  if content =~ /^#\s+(.+)$/m
    title = $1.strip
    # Remove markdown links and formatting
    title.gsub!(/\[([^\]]+)\]\([^)]+\)/, '\1')  # Remove links
    title.gsub!(/`([^`]+)`/, '\1')               # Remove code formatting
    title.gsub!(/\*\*([^*]+)\*\*/, '\1')         # Remove bold
    title.gsub!(/\*([^*]+)\*/, '\1')             # Remove italic
    return title unless title.empty?
  end
  nil
end
