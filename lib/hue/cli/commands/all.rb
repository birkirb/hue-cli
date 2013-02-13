require_relative 'light'

module Hue
  module CLI
    module Commands
      class All < Light

        def execute(*args)
          bridge.lights.each do |number, name|
            super(number, *args)
          end
        end

      end
    end
  end
end
