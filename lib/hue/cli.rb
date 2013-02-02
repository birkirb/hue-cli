require 'hue'
require 'find'
require_relative 'cli/command'
require_relative 'extensions/bulb'
require_relative 'extensions/bridge'

module Hue
  module CLI
    class Error < StandardError; end;

    def self.bridge
      Hue.application
    end

    def self.run(args = [])
      commands = commands_in_object_space

      if args.size > 0
        first_arg = args.shift
        if command = commands[first_arg.to_sym]
          command.new.execute(*args)
        else
          Commands::Light.new.execute(first_arg, *args)
        end
      else
        Command.new.execute
      end
    rescue Hue::Error => err
      puts err.message
    rescue Hue::CLI::Error => err
      puts err.message
    end

    private

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
