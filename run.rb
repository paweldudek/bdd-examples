require 'filewatcher'
require 'system-bang'

workspace_name = Dir["*.xcworkspace"].last
# We assume that the name of the file is also the name of main scheme we'll be testing
scheme_name = workspace_name.partition(".").first

exit_with_message("Expected to find a workspace in current working directory, but none found.") unless workspace_name

FileWatcher.new(["#{scheme_name}/"]).watch do |filename|
  system_command = "xcodebuild test -workspace '#{workspace_name}' -scheme '#{scheme_name}' -sdk iphonesimulator -destination \"platform=iOS Simulator,name=iPad Retina,OS=7.1\" | xcpretty -c --no-utf --test"

  puts "Executing: #{system_command}"
  system!('killall xcodebuild -t `tty` 2>/dev/null || true')
  system! system_command
end

# Helpers

def exit_with_message(msg)
  puts red(msg)
  exit 1
end

def colorize(text, color_code)
  "#{color_code}#{text}\e[0m"
end

def red(text); colorize(text, "\e[31m"); end
