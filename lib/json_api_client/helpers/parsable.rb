module JsonApiClient
  module Helpers
    module Parsable
      extend ActiveSupport::Concern

      included do
        class_attribute :parser
        self.parser = Parsers::Parser
      end

      module ClassMethods
        def parse(data)
          parser.parse(self, data)
        end
      end

    end
  end
end