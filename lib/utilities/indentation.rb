module Indentation
  DEFAULT_INDENTATION_SIZE = 2
  @@indentation_size = 0
  @@indentation_char = ' '
  @@indentation_level = 0

  def indent(size = DEFAULT_INDENTATION_SIZE, &block)
    original_size = @@indentation_size
    @@indentation_size = size
    @@indentation_level += 1
    yield
  ensure
    @@indentation_size = original_size
    @@indentation_level -= 1
  end

  def puts(*message)
    message.each do |line|
      print(@@indentation_char * @@indentation_size * @@indentation_level)
      super(line)
    end
  end
end
