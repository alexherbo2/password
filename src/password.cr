require "crypto/bcrypt/password"
require "yaml"
require "./password/env"

PASSWORDS_PATH = Path[ENV["XDG_CONFIG_HOME"], "passwords.yml"]

alias Passwords = Hash(String, String)

def get_passwords_path
  PASSWORDS_PATH
end

def get_passwords
  passwords = File.open(get_passwords_path) do |file|
    Passwords.from_yaml(file)
  end
end

def write_password(key)
  passwords = get_passwords
  master_password = passwords["master"]
  password_method = [key, master_password].join(':')
  password = Crypto::Bcrypt::Password.create(password_method).to_s
  passwords[key] = password
  File.write(get_passwords_path, passwords.to_yaml)
end
