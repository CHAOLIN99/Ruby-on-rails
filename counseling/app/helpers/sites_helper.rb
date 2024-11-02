module SitesHelper
  # Sets the page title and controls its visibility in the view
  # @param name [String] the title text
  # @param show_title [Boolean] whether to display the title in the view
  # @param site_name [String] optional site name to append/prepend
  # @return [String] the formatted title
  def title(name, show_title: true, site_name: 'Counsel')
    @show_title = show_title
    cleaned_title = sanitize(name.to_s.strip)
    
    content_for(:title) do
      if cleaned_title.present?
        "#{cleaned_title} | #{site_name}"
      else
        site_name
      end
    end
  end

  # Creates a navigation link with active state handling
  # @param text [String] the link text
  # @param path [String] the link path
  # @param options [Hash] additional options for customization
  # @return [String] HTML for the navigation link
  def nav_link(text, path, options = {})
    default_options = {
      class: 'nav-item',
      link_class: 'nav-link',
      active_class: 'active',
      aria_current: 'page'
    }.merge(options)

    link_classes = [default_options[:link_class]]
    link_attrs = {}

    if current_page?(path)
      link_classes << default_options[:active_class]
      link_attrs['aria-current'] = default_options[:aria_current]
    end

    content_tag :li, class: default_options[:class] do
      link_to path, 
              class: link_classes.join(' '),
              aria: link_attrs,
              data: { turbo_track: 'reload' } do
        sanitize(text.to_s)
      end
    rescue StandardError => e
      Rails.logger.error("Error in nav_link helper: #{e.message}")
      fallback_nav_link(text, path)
    end
  end

  # Generates breadcrumb navigation
  # @param items [Array<Hash>] array of breadcrumb items with text and path
  # @return [String] HTML for the breadcrumb navigation
  def breadcrumb(items)
    return if items.blank?

    content_tag :nav, aria: { label: 'Breadcrumb' } do
      content_tag :ol, class: 'breadcrumb' do
        items.map.with_index do |item, index|
          breadcrumb_item(item, index == items.length - 1)
        end.join.html_safe
      end
    end
  end

  private

  # Creates a single breadcrumb item
  # @param item [Hash] breadcrumb item with text and path
  # @param is_active [Boolean] whether this is the current page
  # @return [String] HTML for the breadcrumb item
  def breadcrumb_item(item, is_active = false)
    content_tag :li, 
                class: "breadcrumb-item#{' active' if is_active}",
                aria: (is_active ? { current: 'page' } : {}) do
      if is_active
        sanitize(item[:text].to_s)
      else
        link_to(sanitize(item[:text].to_s), item[:path])
      end
    end
  end

  # Fallback navigation link for error cases
  # @param text [String] the link text
  # @param path [String] the link path
  # @return [String] basic HTML for the navigation link
  def fallback_nav_link(text, path)
    content_tag :li, class: 'nav-item' do
      link_to(sanitize(text.to_s), path, class: 'nav-link')
    end
  end

  # Validates and sanitizes HTML content
  # @param content [String] the content to sanitize
  # @return [String] sanitized content
  def sanitize_content(content)
    sanitize(content.to_s.strip, 
             tags: %w[b i em strong span a], 
             attributes: %w[href title class])
  end
end