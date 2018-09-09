module ActiveModelPresenter
  class Collection < Array
    attr_reader :total_pages, :current_page, :limit_value

    def initialize(collection, klass, params={}, &object)
      super(collection.map { |model| klass.new(model, params, &object) })
      @total_pages = collection.try :total_pages
      @current_page = collection.try :current_page
      @limit_value = collection.try :limit_value
    end
  end
end
