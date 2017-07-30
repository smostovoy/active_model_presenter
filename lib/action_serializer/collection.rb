module ActionSerializer
  class Collection < Array
    attr_reader :total_pages, :current_page, :limit_value

    def initialize(collection, serializer=nil)
      super(collection.map { |item| ActionSerializer::Model.create(item, serializer) })
      @total_pages = collection.try :total_pages
      @current_page = collection.try :current_page
      @limit_value = collection.try :limit_value
    end
  end
end
