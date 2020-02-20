require "../../password"

system(ENV["EDITOR"], { get_passwords_path.to_s })
