class SerializedModel < Hashie::Mash
  include Hashie::Extensions::Mash::KeepOriginalKeys
  include Hashie::Extensions::Mash::SafeAssignment

  def self.create(item, serializer=nil)
    serializer ||= "::#{item.class.name}Serializer".constantize
    hash = serializer.new(item).to_h
    new(hash)
  end

  def is_a?(klass)
    return false if klass == Hash
    super
  end

  def to_param
    id.to_s
  end

  ### implementation of Hashie::Extensions::StrictKeyAccess for Mash + a change for rails form methods
  # https://github.com/intridea/hashie/issues/60#issuecomment-158590985
  def [](key)
    return nil unless key.to_s['came_from_user'].nil? # rails form builder tries to access :some_attr_came_from_user
    fetch(key)
  end

  def key(value)
    result = super
    if result.nil? && (!key?(result) || self[result] != value)
      raise KeyError, "key not found with value of #{value.inspect}"
    else
      result
    end
  end
  ######### End #########
end
