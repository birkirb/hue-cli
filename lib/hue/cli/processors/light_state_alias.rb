module Hue
  module CLI
    module Processors
      class LightStateAlias

        ALIAS_FILE_NAME = 'light_alias.yml'
        ALIAS_FILE_PATHS = [
          File.join(Hue::CLI::LOCATION, 'config'),  # Default
          '/etc/hue/',   # System
          '~/.hue-cli/', # User
        ]

        def self.read_alias_files
          ALIAS_FILE_PATHS.each do |path|
            file_path = File.expand_path(File.join(path, ALIAS_FILE_NAME))
            yaml = YAML.load_file(file_path) rescue []
            yaml.each do |name, state|
              @@alias_map[name.to_sym] = state
            end
          end
        end

        @@alias_map = Hash.new
        read_alias_files

        public

        attr_reader :name,:state

        def initialize(name)
          @name = name
          @state = @@alias_map[name.to_sym]
          if @state.nil?
            raise Error.new("Unknown light state: #{name}")
          end
        end

      end
    end
  end
end
