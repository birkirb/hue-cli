module Hue
  module CLI
    module Commands
      class Light < Hue::CLI::Command

        attr_reader :bulb

        def execute(*args)
          arg = args.shift
          light_number = arg.to_i

          if light_number > 0
            @bulb = Hue::Bulb.new(bridge, light_number)
          else
            raise Hue::CLI::Error.new("Not a valid light number: #{arg}")
          end

          # bulb exists (is valid?)

          if args.size > 0
            method = args.shift.to_sym
            if is_available!(method)
              send(method, *args)
            end
          else
            bulb.print_state
          end
        end

        protected

        def on(*args)
          bulb.on
        end

        def off(*args)
          bulb.off
        end

        def brightness(*args)
          bulb.brightness = args.first
        end

        def flash(*args)
          bulb.flash
        end

        def blink(*args)
          bulb.blink
        end

        def solid(*args)
          bulb.solid
        end

      end
    end
  end
end
