module ApplicationHelper

  def present(model, presenter_class=nil)
    klass = presenter_class || "#{model.class}Presenter".constantize
    presenter = klass.new(model, self)
    yield(presenter) if block_given?
  end

  def active_controller(controller, action = nil)
    return 'active' if params[:controller] == controller && (action ? params[:action] == action : true)
  end

  def svg(name)
    file_path = "#{Rails.root}/app/assets/images/#{name}.svg"
    return File.read(file_path).html_safe if File.exists?(file_path)
    '(not found)'
  end

  def bootstrap_alert_class(flash_key)
    case flash_key
    when "notice"
      "info"
    when "alert"
      "danger"
    else
      flash_key
    end
  end

  def errors_for(object)
      if object.errors.any?
          content_tag(:div, class: "panel panel-danger") do
              concat(content_tag(:div, class: "panel-heading") do
                  concat(content_tag(:h4, class: "panel-title") do
                      concat "#{pluralize(object.errors.count, "error")} prohibited this #{object.class.name.downcase} from being saved:"
                  end)
              end)
              concat(content_tag(:div, class: "panel-body") do
                  concat(content_tag(:ul) do
                      object.errors.full_messages.each do |msg|
                          concat content_tag(:li, msg)
                      end
                  end)
              end)
          end
      end
  end
end
