module Hue
  module CLI
    module Commands
      class Delete < Hue::CLI::Command

        def execute(*args)
          app_id = args.shift

          if app_id.nil?
            bridge.unregister
          else
            b = Bridge.new(app_id, bridge.bridge_uri)
            b.unregister
          end
        end

        protected

        def default(*args)
          Hue.register_default
        end

      end
    end
  end
end
