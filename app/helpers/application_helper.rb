module ApplicationHelper
 def icons
    File.readlines('icons.txt')
  end

  def openwebicons
    File.readlines('openweb.txt')
  end

  def nav_active(options = {})
    a = request.path
    current_route = request.path.split("/")
    @primary = nil
    @secondary = nil
    if  current_route.count > 0
    	@primary = current_route.first.split(".").first # dashboard
    	@secondary = current_route.last.split(".").first
	end
    if options[:primary]
      return "active" if options[:primary] == @primary
    end

    if  options[:secondary]
      return "active" if options[:secondary] == @secondary
    end
  end

  def is_logged?
    return cookies[:username] != nil
  end

  def status_tag(boolean, options={})
    options[:true]        ||= ''
    options[:true_class]  ||= 'status true'
    options[:false]       ||= ''
    options[:false_class] ||= 'status false'

    if boolean
      content_tag(:span, options[:true], :class => options[:true_class])
    else
      content_tag(:span, options[:false], :class => options[:false_class])
    end
  end
  
  def error_messages_for( object )
    render(:partial => 'shared/error_messages', :locals => {:object => object})
  end
end
