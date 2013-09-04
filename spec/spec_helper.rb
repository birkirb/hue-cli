require 'hue/cli'
require 'webmock'
require 'webmock/rspec'
require 'mocha'

WebMock.disable_net_connect!

def with_stdout(expected_output, &block)
  original_stdout = $stdout
  new_stdout = StringIO.new
  begin
    $stdout = new_stdout
    yield
    new_stdout.seek(0)
    output = new_stdout.read
    output.should match(expected_output)
  ensure
    new_stdout.close
    $stdout = original_stdout
  end
end

def mock_bridge
bridge_mock = Hue::Bridge.new('app_id', 'bridge_uri')
Hue::CLI.stubs(:bridge).returns(bridge_mock)
end
