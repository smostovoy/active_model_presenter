class SerializedFormBuilder < ActionView::Helpers::FormBuilder
  module ActionView::Helpers::ActiveModelInstanceTag
    alias_method :original_error_message, :error_message

    def error_message
      object.errors.key?(@method_name) ? original_error_message : []
    end
  end

  def fields_for(record_name, record_object = nil, fields_options = {}, &block)
    fields_options[:builder] ||= options[:builder]
    fields_options[:namespace] = options[:namespace]
    fields_options[:parent_builder] = self
    fields_for_with_nested_attributes(record_name, record_object, fields_options, block)
  end

  def fields_for_with_nested_attributes(association_name, association, options, block)
    name = "#{object_name}[#{association_name}_attributes]"
    association = convert_to_model(association)

    if association.respond_to?(:persisted?)
      association = [association] if association.respond_to?(:to_ary)
    elsif !association.respond_to?(:to_ary)
      association = @object.send(association_name)
    end

    if association.respond_to?(:to_ary)
      explicit_child_index = options[:child_index]
      output = ActiveSupport::SafeBuffer.new
      association.each do |child|
        options[:child_index] = nested_child_index(name) unless explicit_child_index
        output << fields_for_nested_model("#{name}[#{options[:child_index]}]", child, options, block)
      end
      output
    elsif association
      fields_for_nested_model(name, association, options, block)
    end
  end
end
