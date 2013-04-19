module Hue
  module CLI
    module Commands
      class Lights < Hue::CLI::Command

        def execute(*args)
          if args.size > 0
            super
          else
            bridge.print_bulbs
          end
        end

        protected

        def find
          bridge.add_lights
        end

      end
    end
  end
end
