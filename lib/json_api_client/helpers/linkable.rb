module JsonApiClient
  module Helpers
    module Linkable
      extend ActiveSupport::Concern

      included do
        class_attribute :linker
        self.linker = Linking::Links

        # the links for this resource
        attr_accessor :links

        initializer do |obj, params|
          links = params && params.delete("links")
          links ||= {}
          obj.links = obj.linker.new(links)
        end
      end

    end
  end
end
