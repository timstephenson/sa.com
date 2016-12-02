xml.instruct!

xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do

  @locales.each do |locale|
    ::I18n.locale = locale
    ::Refinery::Page.live.in_menu.includes(:parts).each do |page|
     # exclude sites that are external to our own domain.
     page_url = if page.url.is_a?(Hash)
       # This is how most pages work without being overriden by link_url
       page.url.merge({:only_path => false, locale: locale})
     elsif page.url.to_s !~ /^http/
       # handle relative link_url addresses.
       raw_url = [request.protocol, request.host_with_port, page.url].join
       if (@locales.size > 1) && defined?(RoutingFilter::RefineryLocales)
         filter = RoutingFilter::RefineryLocales.new
         filter.around_generate({}) do
           raw_url
         end
       else
         raw_url
       end
     end

     # Add XML entry only if there is a valid page_url found above.
     xml.url do
       xml.loc refinery.url_for(page_url)
       xml.lastmod page.updated_at.to_date
       xml.priority '0.5'
     end if page_url.present? and page.show_in_menu?
    end

    # Here starts refinerycms-blog stuff
    # posts index
    last_post = ::Refinery::Blog::Post.recent(1).first
    xml.url do
      xml.loc refinery.blog_root_url
      xml.lastmod(last_post.updated_at.to_date) unless last_post.nil?
      xml.priority '1'
    end

    # posts
    ::Refinery::Blog::Post.where(draft: false).each do |post|
      post_url = refinery.blog_post_url(post)

      xml.url do
        xml.loc post_url
        xml.lastmod post.updated_at.to_date
        xml.priority '1'
      end
    end

    # Band members
    ::Refinery::Instructors::Instructor.where(active: true).each do |instructor|

      xml.url do
        xml.loc refinery.member_url(instructor)
        xml.lastmod instructor.updated_at.to_date
        xml.priority '1'
      end
    end

    # Events
    Refinery::Events::Event.where(['date >= ?', DateTime.now.beginning_of_day]).order('date ASC').each do |event|

      xml.url do
        xml.loc refinery.events_event_url(event) 
        xml.lastmod event.updated_at.to_date
        xml.priority '1'
      end
    end

  end

end
