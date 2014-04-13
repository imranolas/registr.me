module ApplicationHelper
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields btn btn-primary", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def is_today?(datetime)
    datetime.between?(DateTime.now.beginning_of_day, DateTime.now.end_of_day)
  end

  def display_tick(value)
    if value
      raw("<span class='input-icon fui-check-inverted'> Active</span>")
    else
      raw("<span class='input-icon fui-cross-inverted'> Inactive</span>")
    end
  end

  def datetime_field(object_name, method, options = {})
    InstanceTag.new(object_name, method, self, options.delete(:object)).to_input_field_tag("datetime", options)
  end

  def address(organisation)
    html = "<address>"
    html += "<strong>#{organisation.name}</strong><br>"
    html += [organisation.address1, organisation.address2, organisation.address3, organisation.town, organisation.postcode].compact.reject(&:blank?).map { |a| "#{a}<br>" }.join
    html += "</address>"
    raw(html)
  end
end
