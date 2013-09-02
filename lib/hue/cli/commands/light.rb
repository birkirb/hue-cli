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
            if is_available?(args.first)
              super(*args)
            else
              if _alias = Processors::LightStateAlias.new(args.join(' '))
                bulb.state = _alias.state
              end
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

        def color(*args)
          bulb.color = Colors.parse(*args)
        end

        def name(*args)
          name = args.join(' ')
          bulb.name = name
        end

        def action(*args)
          bulb.effect = args.join
        end

        def effect(*args)
          bulb.effect = args.join
        end

        def colorloop(*args)
          bulb.colorloop
        end

        def clear(*args)
          case args.first
          when 'effect'
            bulb.clear_effect
          when 'action'
            bulb.solid
          else
            bulb.clear_effect
            bulb.solid
          end
        end

        def dump(*args)
          puts bulb.state.to_json
        end

      end
    end
  end
end
