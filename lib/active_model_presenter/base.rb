module ActiveModelPresenter
  class Base < OpenStruct

    def self.present(object, fields, params={}, &block)
      params[:fields] = fields
      if object.is_a?(Array) || object.class.name == 'ActiveRecord::Relation'
        ActiveModelPresenter::Collection.new(object, self, params, &block)
      else
        new(object, params, &block)
      end
    end

    def self.new(model, params={}, &block)
      fields = params.slice(:fields)
      # nested_fields = fields.delete_if do |field|
      #   field.is_a? Hash
      # end
      serializer = params[:serializer]
      serializer ||= "::#{model.class.name}Serializer".constantize
      hash = serializer.new(model).serializable_hash(nil, fields)
      # (fields &(:_reflections)).each do |association_field|
      #   hash[association_field] = ActiveModelPresenter::Collection.new(hash[association_field], self)
      # end
      object = super(hash)
      # nested_fields.each do |nested_field|
      #   object.send("#{nested_field.key}=", present())
      # end
      yield(object, model) if block
      object
    end

    def to_param
      id.to_s
    end

    def attributes
      to_h.keys
    end

    def method_missing(meth, *args)
      raise NoMethodError, "no #{meth} member set yet" unless respond_to?(meth) || meth.to_s.include?('=')
      super
    end
  end
end
