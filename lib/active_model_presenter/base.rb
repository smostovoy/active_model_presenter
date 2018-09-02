module ActiveModelPresenter
  class Base < OpenStruct

    def self.present(object, params={})
      if object.is_a?(Array) || object.class.name == 'ActiveRecord::Relation'
        ActiveModelPresenter::Collection.new(object, self, params)
      else
        new(object, params)
      end
    end

    def self.new(item, params={})
      # fields = params.slice(:fields)
      serializer = params[:serializer]
      serializer ||= "::#{item.class.name}Serializer".constantize
      hash = serializer.new(item).serializable_hash(nil, params.slice(:fields))
      # (fields &(:_reflections)).each do |association_field|
      #   hash[association_field] = ActiveModelPresenter::Collection.new(hash[association_field], self)
      # end
      super(hash)
    end

    def to_param
      id.to_s
    end

    def attributes
      to_h.keys
    end

    def method_missing(meth, *args)
      raise NoMethodError, "no #{meth} member set yet" unless respond_to?(meth)
      super
    end
  end
end
