module ApplicationHelper

  def error_messages_for(object)
    render(:partial => 'application/error_messages', :locals => { :object => object })
  end

  def status_tag(boolean, options = {})
    options[:true_text] ||= ''
    options[:false_text] ||= ''

    if boolean
      content_tag(:span, options[:true_text], :class => 'status true')
    else
      content_tag(:span, options[:false_text], :class => 'status false')
    end
  end


  ####################################### Custom path helpers #######################################
  # Remark : for some reason / Rails doesn't want to create public_show_path(permalink) helper for us
  def public_show_path(permalink)
    unless permalink
      raise "Permalink is nil or false"
    end

    { :controller => "public", :action => "show", :permalink => permalink.to_s }
  end

end
