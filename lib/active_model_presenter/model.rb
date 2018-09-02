module ActiveModelPresenter
  class Model < OpenStruct
    def self.new(item, params={})
      serializer = params[:serializer]
      serializer ||= "::#{item.class.name}Serializer".constantize
      hash = serializer.new(item).serializable_hash(nil, params.slice(:fields))
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
