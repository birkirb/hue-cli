module Hue
  module CLI
    module Commands
      class Register < Hue::CLI::Command

        def initialize
          parse_methods
        end

        def execute(*args)
          if args.size > 0
            super(*args)
          else
            default
          end
        end

        protected

        def default(*args)
          print_button_instructions
          Hue.register_default
        end

        private

        def print_button_instructions
          puts "Please press the button on your bridge."
          sleep 1
          puts "Once done, press Enter to continue with the registration."
          gets
        end

      end
    end
  end
end
