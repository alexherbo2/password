require "crypto/bcrypt/password"
require "yaml"
require "./env"

alias Passwords = Hash(String, String)

class Password
  @passwords : Passwords

  def initialize(@path : Path)
    @passwords = File.open(@path) do |file|
      Passwords.from_yaml(file)
    end
  end

  def master_password
    get("master")
  end

  def get(key)
    @passwords[key]
  end

  def set(key)
    new_password = hash(key)
    @passwords[key] = new_password
  end

  def all
    @passwords
  end

  def keys
    @passwords.keys
  end

  def edit
    system(ENV["EDITOR"], { @path.to_s })
  end

  def create(key)
    set(key)

    save
  end

  def save
    File.write(@path, @passwords.to_yaml)
  end

  def hash(key)
    password_method = [key, master_password].join(':')
    Crypto::Bcrypt::Password.create(password_method).to_s
  end
end
