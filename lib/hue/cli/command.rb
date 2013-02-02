module Hue
  module CLI
    class Command

      public

      def initialize
        @bridge = Hue::CLI.bridge
        @methods = self.class.instance_methods(false).inject(Hash.new(false)) do |hash, method_name|
          hash[method_name] = true
          hash
        end
        @methods[:execute] = false
        # puts "#{self.class.name} : #{@methods.inspect}"
      end

      def execute(*args)
        @bridge.print_state
      end

      protected

      attr_reader :bridge

      def is_available?(method_name)
        @methods[method_name.to_sym]
      end

      def is_available!(method_name)
        is_available?(method_name) or
          raise Error.new("Action '#{method_name.to_s}' is not available for operation '#{name}'")
      end

      private

      def name
        self.class.name.gsub(/.*\:\:/, '').downcase
      end

    end
  end
end
