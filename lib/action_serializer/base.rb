module ActionSerializer
  class Base < ActiveModel::Serializer
    attributes :errors, :persisted, :to_gid, :new_record, :marked_for_destruction, :_destroy

    def errors
      object.errors.present? ? object.errors : Hashie::Mash.new
    end

    def persisted
      object.persisted?
    end

    def to_gid
      persisted ? object.to_gid : nil
    end

    def new_record
      object.new_record?
    end

    def marked_for_destruction
      object.marked_for_destruction?
    end
  end
end