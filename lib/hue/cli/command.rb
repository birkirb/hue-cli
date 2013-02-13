module Hue
  module CLI
    class Command

      public

      def initialize
        set_bridge
        parse_methods
      end

      def execute(*args)
        if args.size > 0
          send_method(*args)
        else
          @bridge.print_state
        end
      end

      private

      attr_reader :bridge

      def is_available?(method_name)
        @methods[method_name.to_sym]
      end

      def is_available!(method_name)
        is_available?(method_name) or
          raise Error.new("Action '#{method_name.to_s}' is not available for operation '#{name}'")
      end

      def name
        self.class.name.gsub(/.*\:\:/, '').downcase
      end

      def set_bridge
        @bridge = Hue::CLI.bridge
      end

      def parse_methods
        @methods = (self.class.instance_methods - Command.instance_methods).inject(Hash.new(false)) do |hash, method_name|
          hash[method_name] = true
          hash
        end
      end

      def send_method(*args)
        method = args.shift.to_sym
        if is_available!(method)
          send(method, *args)
        end
      end

    end
  end
end
