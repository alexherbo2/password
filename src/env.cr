ENV["XDG_CONFIG_HOME"] ||= Path["~/.config"].expand(home: true).to_s
ENV["EDITOR"] ||= "vi"
