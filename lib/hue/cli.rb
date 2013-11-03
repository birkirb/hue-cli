require 'hue'
require 'find'

module Hue
  module CLI

    LOCATION = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))

    require_relative 'cli/command'
    require_relative 'cli/processors/light_state_alias'
    require_relative 'extensions/bulb'
    require_relative 'extensions/bridge'
    require_relative 'extensions/hue'

    class Error < StandardError; end;

    ERROR_BRIDGE_CONNECTION_PROBLEM = /execution expired|No route to host/
    @@retry_count = 0

    def self.bridge
      Hue.application
    end

    def self.run(args = [])
      commands = commands_in_object_space

      if args.size > 0
        first_arg = args.shift
        if command = commands[first_arg.to_sym]
          command.new.execute(*args)
        elsif first_arg.to_i > 0
          Commands::Light.new.execute(first_arg, *args)
        else
          raise Error.new("Unknown command: #{first_arg}")
        end
      else
        print_default
      end
    rescue Hue::Error => err
      if ERROR_BRIDGE_CONNECTION_PROBLEM.match(err.message)
        @@retry_count += 1
        Hue.logger.warn("Error contacting bridge, verifying IP and trying again.")
        Hue.register_bridges
        if @@retry_count > 2
          puts "Giving up contacting bridge after #{@@retry_count} retries."
          bridge.print_config
        else
          retry
        end
      else
        puts err.message
      end
    rescue Hue::CLI::Error => err
      puts err.message
    end

    private

    def self.print_default
      Command.new.execute
    rescue Hue::Config::NotFound => err
      puts "Application not registered."
      if bridges = Hue.register_bridges
        puts "Found bridges:"
        bridges.each do |key, config|
          puts "  #{config.uri} (uuid: #{key})"
        end
        puts
        puts "Please type 'hue register' to register your application with the bridge."
      else
        puts "No bridges found on the local network."
      end
    end

    def self.commands_in_object_space
      require_commands
      commands = Hash.new
      ::ObjectSpace.each_object(Class) do |klass|
        if(Hue::CLI::Command > klass)
          commands[klass.name.gsub(/.*\:\:/, '').downcase.to_sym] = klass
        end
      end
      commands
    end

    def self.require_commands
      Find.find(File.join(File.dirname(__FILE__), 'cli', 'commands')) do |path|
        if File.file?(path) && path.match(/\.rb$/)
          require path
        end
      end
    end

  end
end
