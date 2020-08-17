require "option_parser"
require "./password"
require "./env"

# Passwords location
PASSWORDS_PATH = Path[ENV["XDG_CONFIG_HOME"], "passwords.yml"]

# Subcommand
command = :help

# Option parser
option_parser = OptionParser.new do |parser|
  parser.banner = "Usage: password <command> [arguments]"

  parser.on("create", "Create a new password") do
    command = :create
  end

  parser.on("get", "Get a password") do
    command = :get
  end

  parser.on("menu", "Display a menu") do
    command = :menu
  end

  parser.on("edit", "Edit passwords") do
    command = :edit
  end

  parser.on("help", "Show help") do
    command = :help
  end

  parser.invalid_option do |flag|
    STDERR.puts "Error: Unknown option: #{flag}"
    STDERR.puts parser
    exit(1)
  end
end

# Parse options
option_parser.parse(ARGV)

# Initialization
password = Password.new(PASSWORDS_PATH)

case command
when :create
  password.create(ARGV[0])
when :get
  puts password.get(ARGV[0])
when :menu
  puts password.keys.join('\n')
when :edit
  password.edit
when :help
  puts option_parser
else
  STDERR.puts option_parser
  exit(1)
end
