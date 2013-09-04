module Hue
  module CLI
    module Commands
      class Lights < Hue::CLI::Command

        def execute(*args)
          if args.size > 0
            if is_available?(args.first)
              send_method(*args)
            else
              bridge.lights.each do |number, name|
                Light.new.execute(number, *args)
              end
            end
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
