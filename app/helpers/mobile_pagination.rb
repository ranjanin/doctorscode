module MobilePagination
  class LinkRenderer < WillPaginate::ActionView::LinkRenderer
    
    def to_html
      html = pagination.map do |item|
        item.is_a?(Fixnum) ?
          page_number(item) :
          send(item)
      end.join(tag(:div, @options[:link_separator], {:class => "ui-block-b", :style => "width: 50%; font-size: smaller"}))
      
      @options[:container] ? html_container(html) : html
    end
    
    protected
    
    def html_container(html)
      container_attributes[:style] = "width: 100%; text-align: center"
      tag(:div, tag(:div, html, container_attributes), {:class => "ui-grid-b", :style => "width: 100%"})
    end
    
    def previous_or_next_page(page, text, classname)
      case classname
      when "next_page"
        if page
          tag(:div, link(text, page, {:class => classname, "data-role" => "button", "data-icon" => "arrow-r", "data-iconpos" => "notext", "data-ajax" => "false", :style => "float: right"}), {:class => "ui-block-c", :style => "width: 25%"})
        else
          tag(:div, tag(:div, text, {:class => classname + ' disabled ui-disabled', "data-role" => "button", "data-icon" => "arrow-r", "data-iconpos" => "notext", "data-ajax" => "false", :style => "float: right"}), {:class => "ui-block-c", :style => "width: 25%"})
        end
      when "previous_page"
        if page
          tag(:div, link(text, page, {:class => classname, "data-role" => "button", "data-icon" => "arrow-l", "data-iconpos" => "notext", "data-ajax" => "false"}), {:class => "ui-block-a", :style => "width: 25%"})
        else
          tag(:div, tag(:div, text, {:class => classname + ' disabled ui-disabled', "data-role" => "button", "data-icon" => "arrow-l", "data-iconpos" => "notext", "data-ajax" => "false"}), {:class => "ui-block-a", :style => "width: 25%"})
        end
      end
    end
  end
end